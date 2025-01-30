class SampleJob 
  include QueueRecorder
  @queue = :sample_queue

  def self.perform(name)
    puts "Hello, #{name}!"
    sleep 10
    record_success(@queue)
  rescue 
    record_failure(@queue)
  end
end
