RSpec.describe JWT::OpenStruct do
  let :reserved_claims do
    { iat: Time.current.to_i }
  end

  let :token do
    JWT.encode(payload, nil, nil)
  end

  around do |example|
    Timecop.freeze do
      example.run
    end
  end

  describe '.decode' do
    context 'with no claims' do
      it_behaves_like 'JWT::OpenStruct.decode'
    end

    context 'with claims' do
      it_behaves_like 'JWT::OpenStruct.decode', email: Faker::Internet.email
    end
  end
end
