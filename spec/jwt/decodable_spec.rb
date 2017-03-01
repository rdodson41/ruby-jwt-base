RSpec.describe JWT::Decodable do
  let :decodable do
    JWT.encode(to_h, '9a9aec304dcf460cfb9bf2f8af6051a0', 'HS256')
  end

  let :to_h do
    { email: Faker::Internet.email }
  end

  describe '#jwt' do
    subject do
      decodable.jwt
    end

    it do
      is_expected.to be_a JWT::Token
    end

    describe '#to_s' do
      subject do
        decodable.jwt.to_s
      end

      it do
        is_expected.to eq decodable
      end
    end
  end
end
