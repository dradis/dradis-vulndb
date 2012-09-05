# -*- encoding: utf-8 -*-
version = File.read(File.expand_path('../../dradis/DRADIS_VERSION', __FILE__)).strip

Gem::Specification.new do |gem|
  gem.platform      = Gem::Platform::RUBY
  gem.name          = 'dradis-vulndbhq'
  gem.version       = version
  gem.required_ruby_version = '>= 1.9.3'
  gem.license       = 'GPL-2'

  gem.authors       = ['Daniel Martin']
  gem.email         = ['<daniel@securityroots.com>']
  gem.description   = %q{Import entries from you VulnDB HQ repository into the Dradis Framework}
  gem.summary       = %q{VulnDB HQ plugin for Dradis}
  gem.homepage      = 'http://dradisframework.org'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'dradis_core', version
  gem.add_dependency 'vulndbhq', git: 'git://github.com/dradis/dradis-vulndbhq.git'
end
