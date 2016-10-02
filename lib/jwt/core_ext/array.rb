require 'jwt/core_ext/hash'

module JWT
  module CoreExt
    module Array
      def deep_symbolize_keys
        deep_transform_keys do |key|
          key.is_a?(String) ? key.to_sym : key
        end
      end unless Array.method_defined?(:deep_symbolize_keys)

      def deep_stringify_keys
        deep_transform_keys do |key|
          key.is_a?(Symbol) ? key.to_s : key
        end
      end unless Array.method_defined?(:deep_stringify_keys)

      def deep_transform_keys(&block)
        map do |value|
          value.is_a?(Hash) || value.is_a?(Array) ? value.deep_transform_keys(&block) : value
        end
      end unless Array.method_defined?(:deep_transform_keys)
    end
  end
end

class Array
  include JWT::CoreExt::Array
end
