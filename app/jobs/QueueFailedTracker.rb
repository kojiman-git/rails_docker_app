module QueueFailedTracker
  def on_failure_track_failed(exception, *args)
    queue_name = Resque.queue_from_class(self)
    Resque.redis.incr("failed:#{queue_name}")
    Resque.redis.expire("failed:#{queue_name}", 60) 
  end
end