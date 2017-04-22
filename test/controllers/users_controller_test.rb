require 'test_helper'

def setup
   @user = users(:angie)
   @other_user = users(:jelly)
end






class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
   get signup_path
    assert_response :success
  end

 

end
