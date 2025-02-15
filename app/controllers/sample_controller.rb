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
        processed: Resque.redis.get("processed:#{queue_name}").to_i,
        workers: Resque.workers.count { |w| w.queues.include?(queue_name) },
        working: Resque.working.count { |w| w.queues.include?(queue_name) },
        failed: Resque.redis.get("failed:#{queue_name}").to_i,
      }
    }
  end
end