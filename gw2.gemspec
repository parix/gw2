Gem::Specification.new do |s|
  s.name = "gw2"
  s.version = "1.0.1"
  s.date = "2013-05-22"
  s.summary = "Guild Wars 2 API"
  s.description = "A ruby gem for accessing the Guild Wars 2 API"
  s.authors = ["Chris Rosario"]
  s.email = "c.allen.rosario@gmail.com"
  s.files = %w(LICENSE.md CHANGELOG.md README.md gw2.gemspec)
  s.files += Dir.glob("lib/**/*.rb")
  s.files += Dir.glob("spec/**/*")
  s.homepage = "https://github.com/callenrosario/gw2"
  s.licenses = ['MIT']
  s.require_paths = ['lib']
  s.test_files = Dir.glob("spec/**/*")
end
