require 'spec_helper'

describe JWT::CoreExt::Array do
  describe '#deep_symbolize_keys' do
    let :array do
      [
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
      ]
    end

    let :array_deep_symbolize_keys do
      array.map do |hash|
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
    end

    it do
      expect(array.deep_symbolize_keys).to eq array_deep_symbolize_keys
    end
  end

  describe '#deep_stringify_keys' do
    let :array do
      [
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
      ]
    end

    let :array_deep_stringify_keys do
      array.map do |hash|
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
    end

    it do
      expect(array.deep_stringify_keys).to eq array_deep_stringify_keys
    end
  end
end
