class SampleJob2 
  include QueueRecorder
  @queue = :sample_queue2

  def self.perform(name)
    puts "Hello, #{name}!"
    sleep 10
    1 / 0 #わざとエラー発生させる
    record_success(@queue)
  rescue 
    record_failure(@queue)
  end
end