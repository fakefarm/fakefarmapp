class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper # _dw can I get rid of helpers once pundit?
end
