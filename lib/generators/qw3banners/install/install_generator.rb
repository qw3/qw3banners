# -*- encoding : utf-8 -*-

require 'rails/generators'
require 'rails/generators/migration'

module Qw3banners
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      include Rails::Generators::Migration
      
      source_root File.expand_path("../templates", __FILE__)
      
      # Implement the required interface for Rails::Generators::Migration.
      # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S").to_s + rand(1230).to_s
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end
      
      def create_migrations
        if yes? 'Criar migrations?'
          migration_template 'db/migrate/create_banners.rb', 'db/migrate/create_banners.rb'
          rake 'db:migrate'
        end
      end
      
      def create_routes
        if yes? 'Criar rotas?'
          route "namespace :administrator do
            resources :banners do
              member do
                get 'publicar'
              end
            end
    
            controller :banners do
              get 'banners/publicar'          => :publicar
              post 'banners/multi_remover'    => :multi_remover
              post 'banners/multi_publicar'   => :multi_publicar
              post 'banners/ordenar'          => :ordenar
            end
          "
        end
      end
      
    end
  end
end
