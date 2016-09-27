RSpec.shared_examples 'JWT::Base.encode' do |*arguments|
  let :payload do
    arguments.reduce(reserved_claims, &:merge).compact
  end

  subject do
    JWT::Base.encode(*arguments)
  end

  it do
    is_expected.to eq token
  end
end

RSpec.shared_examples 'JWT::Base#encode' do |*arguments|
  let :base do
    { name: Faker::Internet.user_name }
  end

  let :payload do
    [base, *arguments].reduce(reserved_claims, &:merge).compact
  end

  subject do
    JWT::Base.new(base).encode(*arguments)
  end

  it do
    is_expected.to eq token
  end
end
