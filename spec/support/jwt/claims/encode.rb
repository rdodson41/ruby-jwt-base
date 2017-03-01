RSpec.shared_examples "#{JWT::Claims}#encode" do
  subject do
    claims.encode(key: key, alg: alg)
  end

  context 'when alg is nil' do
    let :alg do
      nil
    end

    context 'when key is nil' do
      let :key do
        nil
      end

      it do
        is_expected.to eq JWT.encode(to_h, nil, nil)
      end
    end

    context 'when key is not nil' do
      let :key do
        '9a9aec304dcf460cfb9bf2f8af6051a0'
      end

      it do
        is_expected.to eq JWT.encode(to_h, nil, nil)
      end
    end
  end

  context 'when alg is not nil' do
    let :alg do
      'HS256'
    end

    context 'when key is nil' do
      let :key do
        nil
      end

      it do
        expect { subject }.to raise_error TypeError
      end
    end

    context 'when key is not nil' do
      let :key do
        '9a9aec304dcf460cfb9bf2f8af6051a0'
      end

      it do
        is_expected.to eq JWT.encode(to_h, key, alg)
      end
    end
  end
end
