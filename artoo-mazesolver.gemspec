# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "artoo-mazesolver/version"

Gem::Specification.new do |s|
  s.name        = "artoo-mazesolver"
  s.version     = Artoo::Mazesolver::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = ["Mike Ford"]
  s.email       = ["mikejford@gmail.com"]
  s.summary     = %q{Artoo adaptor and driver for Mazesolver}
  s.description = %q{Artoo adaptor and driver for Mazesolver, a virtual robot}
  s.homepage    = "https://github.com/mikejford/artoo-mazesolver"
  s.license     = "MIT"
  
  s.files         = ["LICENSE", "Rakefile", "README.md", "lib/artoo-mazesolver.rb", "lib/artoo/adaptors/mazesolver.rb", "lib/artoo/drivers/mazesolver.rb", "lib/artoo-mazesolver/version.rb", "lib/mazesolver/maze.rb", "lib/mazesolver/mazesolver.rb", "test/test_helper.rb", "test/adaptors/mazesolver_adaptor_test.rb", "test/drivers/mazesolver_driver_test.rb"]
  s.test_files    = ["test/test_helper.rb", "test/adaptors/mazesolver_adaptor_test.rb", "test/drivers/mazesolver_driver_test.rb"]
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'artoo', '~> 1.0.0.rc1'
  # TODO: add your development dependencies here
  # EXAMPLE:
  # s.add_development_dependency 'minitest', '~> 5.0'
  # s.add_development_dependency 'minitest-happy'
  # s.add_development_dependency 'mocha', '~> 0.14.0'
end
