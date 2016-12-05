class SocialNetworkService
  def initialize(social_network: SocialNetwork)
    @social_network = social_network
  end 

  def all
    @social_network.all
  end
end
