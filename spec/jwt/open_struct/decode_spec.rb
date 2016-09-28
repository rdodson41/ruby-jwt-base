RSpec.shared_examples 'JWT::OpenStruct.decode' do |*arguments|
  let :payload do
    arguments.reduce(reserved_claims, &:merge).compact
  end

  subject do
    JWT::OpenStruct.decode(token)
  end

  it do
    is_expected.to eq OpenStruct.new(payload)
  end
end
