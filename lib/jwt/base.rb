require 'delegate'
require 'jwt'
require 'jwt/base/version'
require 'jwt/core_ext'
require 'jwt/hash'
require 'jwt/open_struct'

module JWT
  class Base < SimpleDelegator
    def self.encode(*arguments)
      payload = arguments.reduce(reserved_claims, &:merge).compact
      JWT.encode(payload, key, alg)
    end

    def self.decode(token)
      JWT.decode(token, key, !alg.nil?, algorithm: alg).first
    end

    def self.reserved_claims
      { iss: iss, sub: sub, aud: aud, exp: exp, nbf: nbf, iat: iat, jti: jti }.compact
    end

    def self.iss
      nil
    end

    def self.sub
      nil
    end

    def self.aud
      nil
    end

    def self.exp
      nil
    end

    def self.nbf
      nil
    end

    def self.iat
      Time.now.to_i
    end

    def self.jti
      nil
    end

    def self.key
      nil
    end

    def self.alg
      nil
    end

    def encode(*arguments)
      self.class.encode(self, *arguments)
    end
  end
end
