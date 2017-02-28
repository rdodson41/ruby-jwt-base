RSpec.shared_examples "#{JWT::Claims}#encode/fail" do
  context 'when alg is nil' do
    it do
      expect { subject }.to raise_error(NameError)
    end
  end

  context 'when alg is HS256' do
    let :alg { 'HS256' }

    context 'when key is nil' do
      it do
        expect { subject }.to raise_error(NameError)
      end
    end

    context 'when key is not nil' do
      let :key { '9a9aec304dcf460cfb9bf2f8af6051a0' }

      it do
        expect { subject }.to raise_error(NameError)
      end
    end
  end
end
