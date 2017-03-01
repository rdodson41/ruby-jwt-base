RSpec.shared_examples "#{JWT::Token}#decode" do
  subject do
    token.decode(key: key, alg: alg)
  end

  context 'when alg is nil' do
    let :alg { nil }

    context 'when key is nil' do
      let :key { nil }

      it do
        is_expected.to eq JWT.decode(to_s, nil, false, algorithm: nil).first
      end
    end

    context 'when key is not nil' do
      context 'when key is correct' do
        let :key { '9a9aec304dcf460cfb9bf2f8af6051a0' }

        it do
          is_expected.to eq JWT.decode(to_s, nil, false, algorithm: nil).first
        end
      end

      context 'when key is not correct' do
        let :key { 'e0c5eec151c5d17c57feea1eadde1e77' }

        it do
          is_expected.to eq JWT.decode(to_s, nil, false, algorithm: nil).first
        end
      end
    end
  end

  context 'when alg is not nil' do
    context 'when alg is correct' do
      let :alg { 'HS256' }

      context 'when key is nil' do
        let :key { nil }

        it do
          expect { subject }.to raise_error TypeError
        end
      end

      context 'when key is not nil' do
        context 'when key is correct' do
          let :key { '9a9aec304dcf460cfb9bf2f8af6051a0' }

          it do
            is_expected.to eq JWT.decode(to_s, '9a9aec304dcf460cfb9bf2f8af6051a0', true, algorithm: 'HS256').first
          end
        end

        context 'when key is not correct' do
          let :key { 'e0c5eec151c5d17c57feea1eadde1e77' }

          it do
            expect { subject }.to raise_error JWT::VerificationError
          end
        end
      end
    end

    context 'when alg is not correct' do
      let :alg { 'HS512' }

      context 'when key is nil' do
        let :key { nil }

        it do
          expect { subject }.to raise_error JWT::IncorrectAlgorithm
        end
      end

      context 'when key is not nil' do
        context 'when key is correct' do
          let :key { '9a9aec304dcf460cfb9bf2f8af6051a0' }

          it do
            expect { subject }.to raise_error JWT::IncorrectAlgorithm
          end
        end

        context 'when key is not correct' do
          let :key { 'e0c5eec151c5d17c57feea1eadde1e77' }

          it do
            expect { subject }.to raise_error JWT::IncorrectAlgorithm
          end
        end
      end
    end
  end
end
