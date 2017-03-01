require 'jwt'

module JWT
  class Token < SimpleDelegator
    def decode(key:, alg:)
      JWT.decode(to_s, key, !alg.nil?, algorithm: alg).first
    end
  end
end
