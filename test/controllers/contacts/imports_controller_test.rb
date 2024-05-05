require "test_helper"

class Contacts::ImportsControllerTest < ActionDispatch::IntegrationTest
  setup { @account = accounts(:basecamp) }

  test "new" do
    get new_account_contacts_import_url(@account)
    assert_response :success
  end

  test "creating import" do
    assert_difference -> { Import.count } do
      post account_contacts_imports_url(@account), params: { import: { description: :vehicle_data, file: david_vcf } }
      perform_enqueued_jobs
    end

    follow_redirect!
    assert_select "h1", /Does this look right?/
    assert_select "h3", /Heinemeier Hansson/
  end

  test "creating import with error" do
    assert_difference -> { Import.count } do
      post account_contacts_imports_url(@account), params: { import: { description: :vehicle_data, file: invalid_vcf } }
      perform_enqueued_jobs
    end

    follow_redirect!
    assert_select "h1", /We had some trouble importing that vCard/
  end

  test "creating import and waiting" do
    assert_difference -> { Import.count } do
      post account_contacts_imports_url(@account), params: { import: { description: :vehicle_data, file: david_vcf } }
    end

    follow_redirect!
    assert_select "h1", /Just a moment, please, while we process your import/
  end

  private
    def david_vcf
      fixture_file_upload "david.vcf", "text/plain"
    end

    def invalid_vcf
      fixture_file_upload "invalid.vcf", "text/plain"
    end
end
