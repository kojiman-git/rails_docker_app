module QueueRecorder
  extend ActiveSupport::Concern

  class_methods do
    def record_success(queue_name)
      japan_time = Time.now.in_time_zone("Asia/Tokyo")
      Resque.redis.set("queue:#{queue_name}:last_executed", japan_time)
      Resque.redis.incr("queue:#{queue_name}:processed")
    end

    def record_failure(queue_name)
      Resque.redis.incr("queue:#{queue_name}:failed")
    end
  end
end