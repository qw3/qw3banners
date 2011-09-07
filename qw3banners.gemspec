# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "qw3banners/version"

Gem::Specification.new do |s|
  s.name        = "qw3banners"
  s.version     = Qw3banners::VERSION
  s.authors     = ["QW3"]
  s.email       = ["contato@qw3.com.br"]
  s.homepage    = "http://www.qw3.com.br"
  s.summary     = %q{Componente para gerenciamento de banners da plataforma QW3}
  s.description = %q{Gerencia a inclusão, remoção e visualização de banners}

  #s.rubyforge_project = "qw3banners"
  s.add_dependency 'qw3common', :git => 'git://github.com/qw3/qw3common.git'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
