class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def login(user)
    cookies.signed[:user_auth_token] = {:value => user.auth_token, :expires => 30.minutes.from_now}
  end

  def logout(user)
    cookies.delete(:user_auth_token)
  end
end
