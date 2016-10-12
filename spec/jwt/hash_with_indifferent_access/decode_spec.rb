RSpec.shared_examples 'JWT::HashWithIndifferentAccess.decode' do |*arguments|
  let :payload do
    arguments.reduce(reserved_claims, &:merge).compact
  end

  subject do
    JWT::HashWithIndifferentAccess.decode(token)
  end

  it do
    is_expected.to eq payload.with_indifferent_access
  end
end
