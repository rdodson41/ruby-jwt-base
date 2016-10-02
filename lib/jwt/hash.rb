require 'jwt/base'

module JWT
  class Hash < Base
    def self.decode(token)
      super.deep_symbolize_keys
    end
  end
end
