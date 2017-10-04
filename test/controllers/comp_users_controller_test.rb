require 'test_helper'

class CompUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comp_user = comp_users(:one)
  end

  test "should get index" do
    get comp_users_url
    assert_response :success
  end

  test "should get new" do
    get new_comp_user_url
    assert_response :success
  end

  test "should create comp_user" do
    assert_difference('CompUser.count') do
      post comp_users_url, params: { comp_user: { comp_id: @comp_user.comp_id, user_id: @comp_user.user_id } }
    end

    assert_redirected_to comp_user_url(CompUser.last)
  end

  test "should show comp_user" do
    get comp_user_url(@comp_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_comp_user_url(@comp_user)
    assert_response :success
  end

  test "should update comp_user" do
    patch comp_user_url(@comp_user), params: { comp_user: { comp_id: @comp_user.comp_id, user_id: @comp_user.user_id } }
    assert_redirected_to comp_user_url(@comp_user)
  end

  test "should destroy comp_user" do
    assert_difference('CompUser.count', -1) do
      delete comp_user_url(@comp_user)
    end

    assert_redirected_to comp_users_url
  end
end
