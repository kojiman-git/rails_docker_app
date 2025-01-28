class SampleJob
  @queue = :sample_queue

  def self.perform(name)
    begin
      # 処理開始
      puts "Hello, #{name}!"

      sleep 10

      # 処理成功を記録
      Resque.redis.incr("queue:#{@queue}:processed")
    rescue 
      # 処理失敗を記録
      Resque.redis.incr("queue:#{@queue}:failed")
    end
  end
end
