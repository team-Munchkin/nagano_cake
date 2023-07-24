require "test_helper"

class Public::AddressseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_addressse_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_addressse_edit_url
    assert_response :success
  end
end
