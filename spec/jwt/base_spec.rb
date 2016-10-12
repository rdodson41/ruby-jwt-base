require 'spec_helper'

describe JWT::Base do
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

  describe '::VERSION' do
    it do
      expect(JWT::Base::VERSION).to eq '0.3.0'
    end
  end

  describe '.encode' do
    context 'with no claims' do
      it_behaves_like 'JWT::Base.encode'
    end

    context 'with claims' do
      it_behaves_like 'JWT::Base.encode', email: Faker::Internet.email
    end
  end

  describe '.decode' do
    context 'with no claims' do
      it_behaves_like 'JWT::Base.decode'
    end

    context 'with claims' do
      it_behaves_like 'JWT::Base.decode', email: Faker::Internet.email
    end
  end

  describe '.reserved_claims' do
    it do
      expect(JWT::Base.reserved_claims).to eq reserved_claims
    end
  end

  describe '.iss' do
    it do
      expect(JWT::Base.iss).to be_nil
    end
  end

  describe '.sub' do
    it do
      expect(JWT::Base.sub).to be_nil
    end
  end

  describe '.aud' do
    it do
      expect(JWT::Base.aud).to be_nil
    end
  end

  describe '.exp' do
    it do
      expect(JWT::Base.exp).to be_nil
    end
  end

  describe '.nbf' do
    it do
      expect(JWT::Base.nbf).to be_nil
    end
  end

  describe '.iat' do
    it do
      expect(JWT::Base.iat).to eq reserved_claims[:iat]
    end
  end

  describe '.jti' do
    it do
      expect(JWT::Base.jti).to be_nil
    end
  end

  describe '.key' do
    it do
      expect(JWT::Base.key).to be_nil
    end
  end

  describe '.alg' do
    it do
      expect(JWT::Base.alg).to be_nil
    end
  end

  describe '#encode' do
    context 'with no claims' do
      it_behaves_like 'JWT::Base#encode'
    end

    context 'with claims' do
      it_behaves_like 'JWT::Base#encode', email: Faker::Internet.email
    end
  end
end
