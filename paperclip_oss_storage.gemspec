# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip_oss_storage/version'

Gem::Specification.new do |spec|
  spec.name          = "paperclip_oss_storage"
  spec.version       = PaperclipOssStorage::VERSION
  spec.authors       = ["Elite"]
  spec.email         = ["elite.ljp@gmail.com"]
  spec.description   = %q{saving files to Aliyun OSS}
  spec.summary       = %q{saving files to Aliyun OSS}
  spec.homepage      = "https://github.com/adev-cn/paperclip_oss_storage.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency 'paperclip', '>= 3.5.2'
  spec.add_runtime_dependency 'rest-client', '>= 1.6.7'
end
