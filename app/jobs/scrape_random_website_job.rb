class ScrapeRandomWebsiteJob < ApplicationJob
  queue_as :default

  def perform(*args)
    event=Event.new
    event.title = "hello moiz this is job"
    event.save!
  end
end
