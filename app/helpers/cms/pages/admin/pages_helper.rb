module Cms::Pages::Admin
  module PagesHelper
    def options_for_pages
      [['','']] + nested_set_options(Cms::Page, @page) {|i| "#{'-' * i.level} #{i.title}" }
    end
  end
end
