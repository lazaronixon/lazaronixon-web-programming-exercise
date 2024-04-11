require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get account_contacts_url(accounts(:basecamp))
    assert_response :ok
  end
end
