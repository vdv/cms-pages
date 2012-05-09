require "cms/pages/engine"

module Cms
  module Pages
    autoload :InstallGenerator, 'generators/cms/pages/install_generator'
    autoload :ViewsHelper, 'cms/pages/views_helper'

    mattr_accessor :url_prefix
    self.url_prefix = '/cms/pages'
  end
end
