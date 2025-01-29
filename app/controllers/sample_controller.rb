class SampleController < ApplicationController

  #QUEUE=sample_queue rake resque:workで動作する
  def enqueue
    Resque.enqueue(SampleJob, "World")
    render plain: "Job has been enqueued!"
  end
  
  #QUEUE=sample_queue2 rake resque:workで動作する
  def enqueue2
    Resque.enqueue(SampleJob2, "World2")
    render plain: "Job has been enqueued!2"
  end

  def index
    @queues = fetch_queue_status
  end
  
  private
  
  def fetch_queue_status
    Resque.queues.map { |queue_name|
      {
        name: queue_name,
        pending: Resque.size(queue_name),
        processed: Resque.redis.get("queue:#{queue_name}:processed").to_i,
        failed: Resque.redis.get("queue:#{queue_name}:failed").to_i,
        last_executed: Resque.redis.get("queue:#{queue_name}:last_executed"),
        workers: Resque.workers.count { |w| w.queues.include?(queue_name) }
      }
    }
  end
end