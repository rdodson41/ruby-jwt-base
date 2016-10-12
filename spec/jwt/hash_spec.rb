require 'spec_helper'

describe JWT::Hash do
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
      it_behaves_like 'JWT::Hash.decode'
    end

    context 'with claims' do
      it_behaves_like 'JWT::Hash.decode', email: Faker::Internet.email
    end
  end
end
