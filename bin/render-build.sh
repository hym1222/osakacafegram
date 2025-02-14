#!/usr/bin/env bash
# exit on error
set -o errexit

apt-get update && apt-get install -y libpq-dev
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean