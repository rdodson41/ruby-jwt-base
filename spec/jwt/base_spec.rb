require 'spec_helper'

describe JWT::Base do
  it 'has a version number' do
    expect(JWT::Base::VERSION).not_to be nil
  end
end
