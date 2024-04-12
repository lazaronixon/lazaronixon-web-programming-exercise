require 'application_system_test_case'

class ImportingTest < ApplicationSystemTestCase
  setup { @account = accounts(:basecamp) }

  test "importing" do
    visit new_account_import_url(@account)
    attach_file "import_file", file_fixture("david.vcf")
    click_on "Upload and import"

    assert_text "Your import has been processed", wait: 10.seconds
  end
end
