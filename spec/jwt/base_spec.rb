require 'spec_helper'

describe Jwt::Base do
  it 'has a version number' do
    expect(Jwt::Base::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
