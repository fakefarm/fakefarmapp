class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, except: :index
  # after_action :verify_policy_scoped, only: :index

  protect_from_forgery with: :exception

  include ApplicationHelper # _dw can I get rid of helpers once pundit?

private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
