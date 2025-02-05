# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.1.2
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

WORKDIR /rails

# 基本パッケージ（軽量化のため最小限）
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libvips && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 環境変数設定
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development test" \
    LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libjemalloc.so.2"

FROM base AS build

# 必要なパッケージ（ビルド用）
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git pkg-config libpq-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Gemのインストール
COPY Gemfile Gemfile.lock ./
RUN bundle install --verbose && \
    apt-get remove --purge -y build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/* ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# アプリケーションコードをコピー
COPY . .

# assets を事前コンパイル（RAILS_MASTER_KEY不要のダミーキー）
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

FROM base

# 必要なファイルのみコピー（最終イメージを軽量化）
COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails

# 実行ユーザーの作成（セキュリティ向上）
RUN groupadd --system --gid 1000 rails && \
    useradd --system --uid 1000 --gid 1000 --create-home --shell /bin/bash rails && \
    chown -R rails:rails db log storage tmp
USER 1000:1000

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["./bin/rails", "server"]
