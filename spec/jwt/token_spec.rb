require 'support/jwt/token/decode'

RSpec.describe JWT::Token do
  let :claims do
    { email: Faker::Internet.email }
  end

  describe '#decode' do
    context 'when token is an explicit string' do
      let :token do
        JWT.encode(claims, '9a9aec304dcf460cfb9bf2f8af6051a0', 'HS256')
      end

      it_behaves_like "#{described_class}#decode"
    end

    context 'when token is an implicit string' do
      let :token do
        double(to_s: JWT.encode(claims, '9a9aec304dcf460cfb9bf2f8af6051a0', 'HS256'))
      end

      it_behaves_like "#{described_class}#decode"
    end
  end
end
