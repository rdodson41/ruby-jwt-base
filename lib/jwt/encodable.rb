require 'jwt/claims'

module JWT
  module Encodable
    def jwt
      Claims.new(self)
    end
  end
end
