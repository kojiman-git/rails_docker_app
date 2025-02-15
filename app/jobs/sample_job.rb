class SampleJob 
  extend QueueProcessedTracker, QueueFailedTracker

  @queue = :sample_queue

  def self.perform(name)
    puts "Hello, #{name}!"
    sleep 10
  end
end
