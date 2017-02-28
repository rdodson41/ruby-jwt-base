require 'support/jwt/claims/encode'

RSpec.describe JWT::Claims do
  describe '#encode' do
    context 'when claims is an explicit hash' do
      include_examples "#{described_class}#encode", :pass, claims: { email: Faker::Internet.email }
    end

    context 'when claims is an implicit hash' do
      include_examples "#{described_class}#encode", :pass, claims: OpenStruct.new(email: Faker::Internet.email)
    end

    context 'when claims is neither an explicit nor implicit hash' do
      include_examples "#{described_class}#encode", :fail, claims: SecureRandom.uuid
    end
  end
end
