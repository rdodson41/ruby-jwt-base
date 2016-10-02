require 'spec_helper'

describe JWT::CoreExt::Hash do
  describe '#compact' do
    let :hash do
      {
        name: Faker::Internet.user_name,
        email: nil
      }
    end

    let :hash_compact do
      {
        name: hash[:name]
      }
    end

    it do
      expect(hash.compact).to eq hash_compact
    end
  end

  describe '#deep_symbolize_keys' do
    let :hash do
      {
        'name' => Faker::Internet.user_name,
        'email' =>
        {
          'home' => Faker::Internet.email
        },
        'sites' =>
        [
          {
            'url' => Faker::Internet.url
          }
        ]
      }
    end

    let :hash_deep_symbolize_keys do
      {
        name: hash['name'],
        email:
        {
          home: hash['email']['home']
        },
        sites: hash['sites'].map do |site|
          {
            url: site['url']
          }
        end
      }
    end

    it do
      expect(hash.deep_symbolize_keys).to eq hash_deep_symbolize_keys
    end
  end

  describe '#deep_stringify_keys' do
    let :hash do
      {
        name: Faker::Internet.user_name,
        email:
        {
          home: Faker::Internet.email
        },
        sites:
        [
          {
            url: Faker::Internet.url
          }
        ]
      }
    end

    let :hash_deep_stringify_keys do
      {
        'name' => hash[:name],
        'email' =>
        {
          'home' => hash[:email][:home]
        },
        'sites' => hash[:sites].map do |site|
          {
            'url' => site[:url]
          }
        end
      }
    end

    it do
      expect(hash.deep_stringify_keys).to eq hash_deep_stringify_keys
    end
  end
end
