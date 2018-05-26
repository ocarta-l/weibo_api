lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weibo_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'weibo_api'
  spec.version       = WeiboApi::VERSION
  spec.authors       = ['oren']
  spec.email         = ['oren.carta-lag@hotmail.fr']

  spec.summary       = 'A Ruby wrapper for the Weibo API v2.'
  spec.description   = 'A Ruby wrapper for the Weibo API v2.'
  spec.homepage      = 'http://rubygems.org/gems/weibo_api'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'hashie', '~> 0'
  spec.add_development_dependency 'httparty', '~> 0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
