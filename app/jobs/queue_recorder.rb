module QueueRecorder
  extend ActiveSupport::Concern

  class_methods do
    def record_success(queue_name)
      Resque.redis.incr("queue:#{queue_name}:processed")
    end

    def record_failure(queue_name)
      Resque.redis.incr("queue:#{queue_name}:processed")
      Resque.redis.incr("queue:#{queue_name}:failed")
    end
  end
end