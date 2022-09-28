require "rails_helper"

RSpec.describe ScrappingJob, :type => :job do
  describe "perform_later" do
    it "having job enqueued" do
      expect {
        ScrappingJob.perform_later
      }.to have_enqueued_job
    end
  end

  describe "perform_later" do
      it "job enqueued with no wait" do
        expect {
          ScrappingJob.set(queue: "low").perform_later
        }.to have_enqueued_job.with().on_queue("low").at(:no_wait)
      end
    end

    describe "perform_later" do
    it "enqueued with some alias block syntax" do
      expect {
        ScrappingJob.perform_later
      }.to enqueue_job
    end
  end
end
