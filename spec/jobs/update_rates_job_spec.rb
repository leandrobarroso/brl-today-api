require 'rails_helper'

RSpec.describe UpdateRatesJob, type: :job do
  # include ActiveJob::TestHelper

  describe '#perform_later' do
    # Set the queue adapter as :test before each example
    before { ActiveJob::Base.queue_adapter = :test }

    it 'job was enqueued' do
      expect { UpdateRatesJob.perform_later }.to have_enqueued_job
    end

    it 'is in default queue' do
      expect(UpdateRatesJob.new.queue_name).to eq('default')
    end

    it 'job was enqueued with no wait' do
      expect {
        UpdateRatesJob.set(queue: 'default').perform_later('update')
      }.to have_enqueued_job.with('update').on_queue('default').at(:no_wait)
    end

    # it 'executes perform' do
    #   expect(UpdateRatesJob).to receive(:call).with(123)
    #   perform_enqueued_jobs { job }
    # end

    # it 'handles no results error' do
    #   allow(UpdateRatesJob).to receive(:call).and_raise(NoResultsError)

    #   perform_enqueued_jobs do
    #     expect_any_instance_of(UpdateRatesJob)
    #       .to receive(:retry_job).with(wait: 10.minutes, queue: :default)
    #     job
    #   end
    # end

    # after do
    #   clear_enqueued_jobs
    #   clear_performed_jobs
    # end
  end
end
