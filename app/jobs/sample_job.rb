class SampleJob < BaseJob
  @queue = :sample_queue

  def self.perform(name)
    puts "Hello, #{name}!"
    sleep 10
    record_success
  rescue 
    record_failure
  end
end
