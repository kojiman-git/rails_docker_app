class SampleJob2 
  @queue = :sample_queue2

  def self.perform(name)
    puts "Hello, #{name}!"
    sleep 10
    1 / 0 #わざとエラー発生させる
  end
end