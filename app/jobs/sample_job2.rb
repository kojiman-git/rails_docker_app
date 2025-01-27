class SampleJob2
  @queue = :sample_queue2

  def self.perform(name)
    puts "Hello, #{name}!"
  end
end