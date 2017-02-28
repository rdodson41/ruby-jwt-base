require 'support/jwt/claims/encode/fail'
require 'support/jwt/claims/encode/pass'

RSpec.describe JWT::Claims do
  describe '#encode' do
    context 'when claims is an explicit hash' do
      let :claims do
        { email: Faker::Internet.email }
      end

      include_examples "#{described_class}#encode/pass"
    end

    context 'when claims is an implicit hash' do
      let :claims do
        double(to_h: to_h)
      end

      let :to_h do
        { email: Faker::Internet.email }
      end

      include_examples "#{described_class}#encode/pass"
    end

    context 'when claims is neither an explicit nor implicit hash' do
      let :claims do
        SecureRandom.hex
      end

      include_examples "#{described_class}#encode/fail"
    end
  end
end
