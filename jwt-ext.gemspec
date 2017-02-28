lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'jwt/ext/version'

Gem::Specification.new do |spec|
  spec.name          = 'jwt-ext'
  spec.version       = JWT::Ext::VERSION
  spec.authors       = ['Richard E. Dodson']
  spec.email         = ['richard.elias.dodson@gmail.com']

  spec.summary       = 'Ruby JSON Web Token (JWT) Wrapper'
  spec.homepage      = 'https://github.com/rdodson41/ruby-jwt-ext'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split(/\x0/).reject do |file|
    file =~ %r{^(test|spec|features)/}
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) do |file|
    File.basename(file)
  end
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.0'

  spec.add_runtime_dependency 'jwt', '~> 1.5'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  spec.add_development_dependency 'faker', '~> 1.6'
  spec.add_development_dependency 'mutant-rspec', '~> 0.8'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.43'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'timecop', '~> 0.8'
end
