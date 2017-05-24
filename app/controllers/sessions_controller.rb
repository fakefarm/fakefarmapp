class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Welcome back, #{user.name}"
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
      redirect_to user
    else
      flash.now[:notice] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = 'You have successfully logged out.'
    redirect_to root_url
  end
end
