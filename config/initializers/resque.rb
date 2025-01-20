require 'resque'
require 'redis'

# Redisの設定
Resque.redis = Redis.new(host: 'redis', port: 6379)