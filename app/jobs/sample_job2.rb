class SampleJob2 < BaseJob
  @queue = :sample_queue2

  def self.perform(name)
    puts "Hello, #{name}!"
    sleep 10
    1 / 0 #わざとエラー発生させる
    record_success
  rescue 
    record_failure
  end
end