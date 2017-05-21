class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Welcome back, #{user.name}"
      log_in user
      redirect_to user
    else
      flash.now[:notice] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    flash[:notice] = 'You have successfully logged out.'
    redirect_to root_path
  end
end
