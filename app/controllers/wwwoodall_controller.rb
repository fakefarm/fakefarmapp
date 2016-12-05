class WwwoodallController < ApplicationController
  def index
    @networks = SocialNetworkService.new.all
  end
end
