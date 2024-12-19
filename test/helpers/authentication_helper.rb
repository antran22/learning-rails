module AuthenticationHelper
  def logged_in?
    not cookies[:session_id].nil?
  end

  def log_in_as(user, password: "password")
    post login_path,
         params: {
           email_address: user.email_address,
           password: password
         }
  end

  def log_out
    delete logout_path
  end
end
