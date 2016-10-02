RSpec.shared_examples 'JWT::Base.decode' do |*arguments|
  let :payload do
    arguments.reduce(reserved_claims, &:merge).compact
  end

  subject do
    JWT::Base.decode(token)
  end

  it do
    is_expected.to eq payload.deep_stringify_keys
  end
end
