Gem::Specification.new do |s|
  s.name        = 'kele'
  s.version     = '0.0.0'
  s.date        = '2017-04-10'
  s.summary     = "hello!"
  s.description = "A simple hello world gem"
  s.authors     = ["John P"]
  s.email       = 'john@email.com'
  s.files       = ["lib/kele.rb"]
  s.homepage    =
    'http://www.cnn.com'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_runtime_dependency 'json', '~> 1.8'
end
