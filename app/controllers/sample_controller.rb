class SampleController < ApplicationController
  def enqueue
    Resque.enqueue(SampleJob, "World")
    render plain: "Job has been enqueued!"
  end

  def index
    # Resqueのキューとジョブの状態を取得
    @queues = Resque.queues.map do |queue_name|
      {
        name: queue_name,
        size: Resque.size(queue_name),
        processed: Resque::Stat[:processed],
        failed: Resque::Stat[:failed],
        pending: Resque.info[:pending]
      }
    end
  end
end