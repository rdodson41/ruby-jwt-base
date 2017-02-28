RSpec.shared_examples "#{JWT::Claims}#encode/pass" do
  subject do
    described_class.new(claims).encode(key: key, alg: alg)
  end

  context 'when alg is nil' do
    let :alg { nil }
    let :key { nil }

    it do
      is_expected.to eq JWT.encode(claims.to_h, nil, nil)
    end
  end

  context 'when alg is HS256' do
    let :alg { 'HS256' }

    context 'when key is nil' do
      let :key { nil }

      it do
        expect { subject }.to raise_error(TypeError)
      end
    end

    context 'when key is not nil' do
      let :key { '9a9aec304dcf460cfb9bf2f8af6051a0' }

      it do
        is_expected.to eq JWT.encode(claims.to_h, '9a9aec304dcf460cfb9bf2f8af6051a0', 'HS256')
      end
    end
  end
end
