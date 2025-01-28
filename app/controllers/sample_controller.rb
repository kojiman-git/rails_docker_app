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
    @queues = Resque.queues.map do |queue_name|
      {
        name: queue_name,
        pending: Resque.size(queue_name),                                  # 現在のジョブ数
        processed: Resque.redis.get("queue:#{queue_name}:processed").to_i,  # 処理済みジョブ数
        failed: Resque.redis.get("queue:#{queue_name}:failed").to_i         # 失敗したジョブ数
      }
    end
  end
end