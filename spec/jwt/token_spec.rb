require 'support/jwt/token/decode'

RSpec.describe JWT::Token do
  let :to_s do
    JWT.encode(to_h, '9a9aec304dcf460cfb9bf2f8af6051a0', 'HS256')
  end

  let :to_h do
    { email: Faker::Internet.email }
  end

  context 'when token is an explicit string' do
    let :token do
      described_class.new(to_s)
    end

    describe '#decode' do
      it_behaves_like "#{described_class}#{description}"
    end
  end

  context 'when token is an implicit string' do
    let :token do
      described_class.new(double(to_s: to_s))
    end

    describe '#decode' do
      it_behaves_like "#{described_class}#{description}"
    end
  end
end
