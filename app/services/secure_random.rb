# _dw finish this refactor
module SecureRandom
  def self.new_token(string)
    SecureRandom.urlsafe_base64
  end
end
