require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:john)
  end

  test "login with valid credentials" do
    assert_not logged_in?
    post login_url,
         params: {
           email_address: @user.email_address,
           password: "password"
         }
    assert_redirected_to root_url
    assert logged_in?
  end

  test "login with invalid credentials" do
    assert_not logged_in?
    post login_url,
         params: {
           email_address: @user.email_address,
           password: "wrong_password"
         }
    assert_response :unprocessable_entity
    assert_not logged_in?
  end

  test "register with valid parameters" do
    assert_difference "User.count", 1 do
      post signup_url,
           params: {
             user: {
               name: "new user",
               email_address: "new@example.com",
               password: "newpassword123",
               password_confirmation: "newpassword123"
             }
           }
    end
    assert_redirected_to root_url
  end

  test "register with invalid parameters" do
    assert_no_difference "User.count" do
      post signup_url,
           params: {
             user: {
               name: "new user",
               email_address: "invalid-email",
               password: "short",
               password_confirmation: "short"
             }
           }
    end
    assert_response :unprocessable_entity
    assert_template :signup_page
  end
end
