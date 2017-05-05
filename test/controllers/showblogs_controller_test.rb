require 'test_helper'

class ShowblogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get showblogs_new_url
    assert_response :success
  end

end
