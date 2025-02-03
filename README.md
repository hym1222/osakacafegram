# Osakacafegram

## 概要

Osakacafegramは、大阪のカフェに特化したSNSプラットフォームです。ユーザーはカフェの店舗名、感想、写真を投稿し、他のユーザーと情報を簡単に交換することができます。さらに、お気に入りのカフェを共有したり、他のユーザーのおすすめメニューや楽しみ方を参考にしたりすることができます。

## サイトテーマ

**「大阪のカフェ巡りをもっと楽しく、もっと身近に」**

## このテーマを選んだ理由

カフェは単なる飲食の場に留まらず、友人との会話や一人での作業を楽しむための空間としても活用されています。お気に入りのカフェで過ごす時間は、心の栄養となり、日常をより豊かにしてくれます。

私は大阪府内のカフェに行くことが多いのですが、大阪のカフェに関する記録や情報交換を簡単に行える場がまだ不足していると感じました。個人のブログやSNSでは情報が埋もれがちですが、このアプリでは大阪のカフェに特化した情報を一元的に集め、手軽に共有・閲覧できる仕組みを提供します。

### 開発のきっかけ

カフェ巡りをする中で、
- 「他の人はこのカフェをどのように楽しんでいるのか？」
- 「まだ自分が知らない素敵なカフェがあるのではないか？」

と感じることが多く、調べる際に苦労しました。この課題を解決し、カフェ好きな人同士が気軽に情報交換できる場を作りたいと思ったのがきっかけです。


### 課題
- カフェ情報がSNSやブログに分散しており、大阪に限定した情報を収集するのが困難
- リアルな口コミや写真を一括して閲覧できるプラットフォームが少ない
- ユーザー同士が直接交流できるコミュニティが不足している

### 解決策
- 大阪のカフェに特化した投稿システムを提供し、店舗名、感想、写真を一括して共有可能に
- ユーザー同士がコメントや「いいね」を通じて交流できるコミュニティ機能を充実させ、カフェ巡りをより楽しいものに

## ターゲットユーザー

- カフェが好きな人
- 新しいカフェを探している人
- カフェの情報や写真を共有したい人

## 主な利用シーン

- 大阪のカフェ巡りを計画する際に情報を検索する時
- 気に入ったカフェの写真や感想を共有したい時
- 他のユーザーの投稿を見て新しいカフェを発見したい時

## 利用方法

1. **新規登録またはログイン**
2. **カフェ情報の検索や閲覧**
3. **自分の訪れたカフェの情報を投稿し、写真と感想を共有**
4. **他のユーザーの投稿にコメントや「いいね」を送る**

## 機能一覧

- 基本的なCRUD機能
- ユーザー認証機能（devise）
- 画像アップロード機能（Refile）
- いいね機能
- コメント機能
- フォローフォロワー機能
- DM機能
- 下書き機能
- 検索機能
- 閲覧数表示機能
- バリデーション
- ページネーション
- レスポンシブ対応

## 開発環境

- **OS:** Mac + ターミナル
- **言語:** HTML、CSS、JavaScript、Ruby
- **フレームワーク:** Ruby on Rails
- **JSライブラリ:** jQuery
- **データベース:** PostgreSQL

## インストール方法

```sh
# リポジトリをクローン
git clone https://github.com/yourusername/osakacafegram.git
cd osakacafegram

# 必要なGemをインストール
bundle install

# データベースの作成・マイグレーション
rails db:create
rails db:migrate

# サーバーを起動
rails server
```

## ライセンス

このプロジェクトはMITライセンスのもとで公開されています。
