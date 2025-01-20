class SampleController < ApplicationController
  def index
    Resque.enqueue(SampleJob, "World")
    render plain: "Job has been enqueued!"
  end
end