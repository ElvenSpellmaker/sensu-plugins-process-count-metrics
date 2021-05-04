lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'
require_relative 'lib/sensu-plugins-process-count-metrics/version'

Gem::Specification.new do |s|
  s.authors                = ['Jack']
  s.date                   = Date.today.to_s
  s.description            = 'A Sensu plug-in to provide count metrics for processes'
  s.executables            = Dir.glob('bin/**/*.{rb}').map { |file| File.basename(file) }
  s.files                  = Dir.glob('{bin,lib}/**/*') + %w[README.md]
  s.license                = 'MIT'
  s.homepage               = 'https://github.com/ElvenSpellmaker/sensu-plugins-process-count-metrics'
  s.metadata               = { 'maintainer'         => '@ElvenSpellmaker',
                               'development_status' => 'active',
                               'production_status'  => 'unstable - testing recommended',
                               'release_draft'      => 'false',
                               'release_prerelease' => 'false' }
  s.name                   = 'sensu-plugins-process-count-metrics'
  s.platform               = Gem::Platform::RUBY
  s.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  s.require_paths          = ['lib']
  s.required_ruby_version  = '>= 2.3'
  s.summary                = 'Sensu plug-in to provide count metrics for processes'
  s.test_files             = s.files.grep(%r{^(test|spec|features)/})
  s.version                = SensuPluginsProcessCountMetrics::Version::VER_STRING

  s.add_runtime_dependency 'sensu-plugin', '>= 1.2', '< 5.0'

  s.add_development_dependency 'rspec', '~> 3.0'
end
