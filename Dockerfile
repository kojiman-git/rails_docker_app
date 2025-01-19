# 使用するベースイメージ
FROM ruby:3.1

# 必要なライブラリのインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# 作業ディレクトリを作成
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile Gemfile.lock ./

# bundlerで必要なgemをインストール
RUN bundle install

# アプリケーションコードをコピー
COPY . .

# ポート3000でRailsを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
