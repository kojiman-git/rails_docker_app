module QueueProcessedTracker
  def after_perform_track_processed(*args)
    queue_name = Resque.queue_from_class(self)
    Resque.redis.incr("processed:#{queue_name}")
    Resque.redis.expire("processed:#{queue_name}", 60) 
  end
end