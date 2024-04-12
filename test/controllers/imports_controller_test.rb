require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup { @account = accounts(:basecamp) }

  test "new" do
    get new_account_import_url(@account)
    assert_response :success
  end

  test "creating import" do
    assert_difference -> { @account.imports.count } do
      post account_imports_url(@account), params: { import: { description: :vehicle_data, file: david_vcf } }
      perform_enqueued_jobs
    end

    follow_redirect!
    assert_select "h1", /Your import has been processed/
  end

  test "creating import with error" do
    post account_imports_url(@account), params: { import: { description: :vehicle_data, file: invalid_vcf } }
    perform_enqueued_jobs

    follow_redirect!
    assert_select "h1", /Your import has failed/
  end

  test "creating import and waiting" do
    post account_imports_url(@account), params: { import: { description: :vehicle_data, file: david_vcf } }

    follow_redirect!
    assert_select "h1", /Just a moment, please, while we process your import/
  end  

  private
    def david_vcf
      fixture_file_upload("david.vcf", "text/plain")
    end

    def invalid_vcf
      fixture_file_upload("invalid.vcf", "text/plain")
    end
end
