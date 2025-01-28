class SampleJob2
  @queue = :sample_queue2

  def self.perform(name)
    begin
      # 処理開始
      puts "Hello, #{name}!"

      sleep 10

      1 / 0

      # 処理成功を記録
      Resque.redis.incr("queue:#{@queue}:processed")
    rescue 
      # 処理失敗を記録
      Resque.redis.incr("queue:#{@queue}:failed")
    end
  end
end