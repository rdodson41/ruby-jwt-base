RSpec.describe JWT::Encodable do
  let :encodable do
    { email: Faker::Internet.email }
  end

  describe '#jwt' do
    subject do
      encodable.jwt
    end

    it do
      is_expected.to be_a JWT::Claims
    end

    it do
      expect(subject.to_h).to eq encodable
    end
  end
end
