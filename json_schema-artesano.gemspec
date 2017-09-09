# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'json_schema/artesano/version'

Gem::Specification.new do |spec|
  spec.name          = 'json_schema-artesano'
  spec.version       = JsonSchema::Artesano::VERSION
  spec.authors       = ["Alfonso Mancilla"]
  spec.email         = ["almancill@gmail.com"]

  spec.summary       = %q{Json Schema data generator}
  spec.description   = %q{Generate data (objects, or anything else you like) from a given JSON Schema}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
