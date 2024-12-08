# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "capistrano-symfony-asset-mapper"
  spec.version       = '0.1.0'  # Version initiale
  spec.authors       = ["Ahmed EBEN HASSINE"]
  spec.email         = ["ahmedbhs123@gmail.com"]

  spec.summary       = %q{AssetMapper & sass build support for Capistrano 3.x}
  spec.description   = %q{Provides integration for AssetMapper and Sass build support in Capistrano 3.x environments.}
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/ahmed-bhs/capistrano-symfony-asset-mapper"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = "https://github.com/ahmed-bhs/capistrano-symfony-asset-mapper"
    spec.metadata['changelog_uri'] = "https://github.com/ahmed-bhs/capistrano-symfony-asset-mapper/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'capistrano', '~> 3.1', '>= 3.1.0'
  spec.add_dependency 'capistrano-symfony', '~> 0.4', '>= 0.4.0'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
