require 'jwt'

module JWT
  class Claims < SimpleDelegator
    def encode(key:, alg:)
      JWT.encode(to_h, key, alg)
    end
  end
end
