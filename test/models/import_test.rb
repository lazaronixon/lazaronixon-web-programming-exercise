require "test_helper"

class ImportTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper, ActionDispatch::TestProcess

  setup { @account = accounts(:basecamp) }

  test "creating import" do
    assert_enqueued_with(job: ImporterJob) do
      @account.imports.create!(file: david_vcf)
    end
  end

  private
    def david_vcf
      fixture_file_upload("david.vcf", "text/plain")
    end
end
