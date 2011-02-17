Gem::Specification.new do |s|
  s.name = "ion-server"
  s.version = "0.0.2"
  s.summary = %{A RESTful server for Ion, the simple search engine powered by Redis.}
  s.description = %Q{Ion is a library that lets you index your records and search them with simple or complex queries. Ion-server exposes a RESTful API to Ion services via HTTP.}
  s.authors = ["Rico Sta. Cruz"]
  s.email = ["rico@sinefunc.com"]
  s.homepage = "http://github.com/rstacruz/ion-server"
  s.files = ["lib/ion/server/helpers.rb", "lib/ion/server/server/helpers.rb", "lib/ion/server.rb", "test/test_helper.rb", "test/unit/server_test.rb", "www/config.ru", "README.md", "Rakefile"]

  s.add_dependency "ion", "0.0.2"
  s.add_dependency "cuba", "~> 1.0"
  s.add_dependency "unicorn", "~> 3.4"
  s.add_dependency "clap", "~> 0.0"
end
