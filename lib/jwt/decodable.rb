require 'jwt/token'

module JWT
  module Decodable
    def jwt
      Token.new(self)
    end
  end
end
