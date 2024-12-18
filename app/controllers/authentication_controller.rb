class AuthenticationController < ApplicationController
  allow_unauthenticated_access
  rate_limit to: 10, within: 3.minutes, only: %i[ login signup ], with: -> { redirect_to login_path, alert: "Try again later." }

  def login_page
  end

  def login
    if (user = User.authenticate_by(params.permit(:email_address, :password)))
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to login_path, alert: "Try another email address or password."
    end
  end

  def logout
    terminate_session
    redirect_to login_path
  end

  def signup_page
    @user = User.new
  end

  def signup
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to root_path, notice: "Successfully signed up!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
