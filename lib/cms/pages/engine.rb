module Cms
  module Pages
    class Engine < ::Rails::Engine
      isolate_namespace Cms::Pages
      engine_name :cms_pages
      
      config.generators do |g|
        g.orm             :active_record
        g.template_engine :haml
        g.test_framework  :rspec
      end
      
      config.to_prepare do
        ApplicationController.helper(Cms::Pages::ViewsHelper)
      end

      # initializer "cms/pages.views_helper" do
      #   ActiveSupport.on_load :action_view do
      #     ActionView::Base.send :include, Cms::Pages::ViewsHelper
      #   end
      # end

    end
  end
end
