module Cms
  module Pages
    class InstallGenerator < ::Rails::Generators::Base
      def rake_db
        rake("cms_pages:install:migrations")
      end

      def append_load_seed_data
        create_file 'db/seeds.rb' unless File.exists?(File.join('db', 'seeds.rb'))
        append_file 'db/seeds.rb', :verbose => true do
          <<-EOH

# Added by CMS Settings engine
Cms::Pages::Engine.load_seed
          EOH
        end
      end

      def add_routes
        route 'mount Cms::Pages::Engine => "/cms/pages"'
      end
    end
  end
end