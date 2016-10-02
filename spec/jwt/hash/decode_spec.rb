RSpec.shared_examples 'JWT::Hash.decode' do |*arguments|
  let :payload do
    arguments.reduce(reserved_claims, &:merge).compact
  end

  subject do
    JWT::Hash.decode(token)
  end

  it do
    is_expected.to eq payload.deep_symbolize_keys
  end
end
