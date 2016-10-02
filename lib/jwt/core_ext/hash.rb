require 'jwt/core_ext/array'

module JWT
  module CoreExt
    module Hash
      def compact
        select do |_key, value|
          !value.nil?
        end
      end unless Hash.method_defined?(:compact)

      def deep_symbolize_keys
        deep_transform_keys do |key|
          key.is_a?(String) ? key.to_sym : key
        end
      end unless Hash.method_defined?(:deep_symbolize_keys)

      def deep_stringify_keys
        deep_transform_keys do |key|
          key.is_a?(Symbol) ? key.to_s : key
        end
      end unless Hash.method_defined?(:deep_stringify_keys)

      def deep_transform_keys(&block)
        each_with_object({}) do |(key, value), hash|
          hash[yield(key)] = value.is_a?(Hash) || value.is_a?(Array) ? value.deep_transform_keys(&block) : value
        end
      end unless Hash.method_defined?(:deep_transform_keys)
    end
  end
end

class Hash
  include JWT::CoreExt::Hash
end
