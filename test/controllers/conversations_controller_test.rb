require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get conversations_new_url
    assert_response :success
  end

  test "should get index" do
    get conversations_index_url
    assert_response :success
  end

end
