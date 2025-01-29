class BaseJob
  def self.record_success
    japan_time = Time.now.in_time_zone("Asia/Tokyo")
    Resque.redis.set("queue:#{@queue}:last_executed", japan_time)
    Resque.redis.incr("queue:#{@queue}:processed")
  end

  def self.record_failure
    Resque.redis.incr("queue:#{@queue}:failed")
  end
end