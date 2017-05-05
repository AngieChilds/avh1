require 'test_helper'

class ShowrunsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get showruns_new_url
    assert_response :success
  end

  test "should get edit" do
    get showruns_edit_url
    assert_response :success
  end

  test "should get index" do
    get showruns_index_url
    assert_response :success
  end

end
