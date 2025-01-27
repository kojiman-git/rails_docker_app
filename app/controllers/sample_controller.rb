class SampleController < ApplicationController
  def enqueue
    Resque.enqueue(SampleJob, "World")
    render plain: "Job has been enqueued!"
  end

  def enqueue2
    Resque.enqueue(SampleJob2, "World2")
    render plain: "Job has been enqueued!2"
  end

  def index
    # Resqueのキューとジョブの状態を取得
    @queues = Resque.queues.map do |queue_name|
      {
        name: queue_name,
        size: Resque.size(queue_name),
        processed: Resque::Stat[:processed],
        failed: Resque::Stat[:failed],
      }
    end
  end
end