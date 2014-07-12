class SessionsController < ApplicationController
	
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      login(@user)
      url = session[:return_to] ? session[:return_to] : root_url
      url = root_url if url.include?('/login')
      session[:return_to] = nil
      redirect_to url, :notice => "Logged in."
    else
      flash['alert'] = "Invalid email or password"
      redirect_to new_session_url
    end
  end

  def destroy
    logout(current_user)
    redirect_to root_url, :notice => "Logged out!"
  end

end
