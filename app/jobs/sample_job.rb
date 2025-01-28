class SampleJob
  @queue = :sample_queue

  def self.perform(name)
    begin
      # 処理開始
      puts "Hello, #{name}!"

      sleep 10

      # 処理成功時にタイムスタンプを記録
      japan_time = Time.now.in_time_zone("Asia/Tokyo")
      Resque.redis.set("queue:#{@queue}:last_executed", japan_time)
      # 処理成功を記録
      Resque.redis.incr("queue:#{@queue}:processed")
    rescue 
      # 処理失敗を記録
      Resque.redis.incr("queue:#{@queue}:failed")
    end
  end
end
