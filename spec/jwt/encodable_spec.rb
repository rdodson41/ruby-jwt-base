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

    describe '#to_h' do
      subject do
        encodable.jwt.to_h
      end

      it do
        is_expected.to eq encodable
      end
    end
  end
end
