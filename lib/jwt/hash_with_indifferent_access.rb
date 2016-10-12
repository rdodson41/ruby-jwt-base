require 'jwt/base'

module JWT
  class HashWithIndifferentAccess < Base
    def self.decode(token)
      super.with_indifferent_access
    end
  end
end
