require 'jwt/claims/encode/fail'
require 'jwt/claims/encode/pass'

RSpec.shared_examples "#{JWT::Claims}#encode" do |type, claims:|
  let :key { nil }
  let :alg { nil }

  subject do
    JWT::Claims.new(claims).encode(key: key, alg: alg)
  end

  include_examples "#{JWT::Claims}#encode/#{type}", claims: claims
end
