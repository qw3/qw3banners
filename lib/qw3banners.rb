require "qw3banners/version"

module Qw3banners
  class Qw3banners < Rails::Engine
    config.autoload_paths << File.expand_path("../app", __FILE__)
  end
end
