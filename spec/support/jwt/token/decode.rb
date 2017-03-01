RSpec.shared_examples "#{JWT::Token}#decode" do
  subject do
    token.decode(key: key, alg: alg)
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
        is_expected.to eq JWT.decode(to_s, nil, false, algorithm: nil).first
      end
    end

    context 'when key is not nil' do
      context 'when key is correct' do
        let :key do
          '9a9aec304dcf460cfb9bf2f8af6051a0'
        end

        it do
          is_expected.to eq JWT.decode(to_s, nil, false, algorithm: nil).first
        end
      end

      context 'when key is not correct' do
        let :key do
          'e0c5eec151c5d17c57feea1eadde1e77'
        end

        it do
          is_expected.to eq JWT.decode(to_s, nil, false, algorithm: nil).first
        end
      end
    end
  end

  context 'when alg is not nil' do
    context 'when alg is correct' do
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
        context 'when key is correct' do
          let :key do
            '9a9aec304dcf460cfb9bf2f8af6051a0'
          end

          it do
            is_expected.to eq JWT.decode(to_s, key, true, algorithm: alg).first
          end
        end

        context 'when key is not correct' do
          let :key do
            'e0c5eec151c5d17c57feea1eadde1e77'
          end

          it do
            expect { subject }.to raise_error JWT::VerificationError
          end
        end
      end
    end

    context 'when alg is not correct' do
      let :alg do
        'HS512'
      end

      context 'when key is nil' do
        let :key do
          nil
        end

        it do
          expect { subject }.to raise_error JWT::IncorrectAlgorithm
        end
      end

      context 'when key is not nil' do
        context 'when key is correct' do
          let :key do
            '9a9aec304dcf460cfb9bf2f8af6051a0'
          end

          it do
            expect { subject }.to raise_error JWT::IncorrectAlgorithm
          end
        end

        context 'when key is not correct' do
          let :key do
            'e0c5eec151c5d17c57feea1eadde1e77'
          end

          it do
            expect { subject }.to raise_error JWT::IncorrectAlgorithm
          end
        end
      end
    end
  end
end
