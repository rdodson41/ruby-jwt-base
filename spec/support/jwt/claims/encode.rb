RSpec.shared_examples "#{JWT::Claims}#encode" do
  subject do
    claims.encode(key: key, alg: alg)
  end

  context 'when alg is nil' do
    let :alg { nil }

    context 'when key is nil' do
      let :key { nil }

      it do
        is_expected.to eq JWT.encode(to_h, nil, nil)
      end
    end

    context 'when key is not nil' do
      let :key { '9a9aec304dcf460cfb9bf2f8af6051a0' }

      it do
        is_expected.to eq JWT.encode(to_h, nil, nil)
      end
    end
  end

  context 'when alg is not nil' do
    let :alg { 'HS256' }

    context 'when key is nil' do
      let :key { nil }

      it do
        expect { subject }.to raise_error TypeError
      end
    end

    context 'when key is not nil' do
      let :key { '9a9aec304dcf460cfb9bf2f8af6051a0' }

      it do
        is_expected.to eq JWT.encode(to_h, '9a9aec304dcf460cfb9bf2f8af6051a0', 'HS256')
      end
    end
  end
end
