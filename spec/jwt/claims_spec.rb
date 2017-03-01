require 'support/jwt/claims/encode'

RSpec.describe JWT::Claims do
  let :to_h do
    { email: Faker::Internet.email }
  end

  context 'when claims is an explicit hash' do
    let :claims do
      described_class.new(to_h)
    end

    describe '#encode' do
      it_behaves_like "#{described_class}#{description}"
    end
  end

  context 'when claims is an implicit hash' do
    let :claims do
      described_class.new(double(to_h: to_h))
    end

    describe '#encode' do
      it_behaves_like "#{described_class}#{description}"
    end
  end
end
