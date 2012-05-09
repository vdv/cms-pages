module Cms::Pages
  module ViewsHelper
    def cms_pages_menu(*options)
      opts = options.extract_options!
      opts[:tag] ||= :li
      Cms::Page.roots.for_menu.map do |page|
        content_tag opts[:tag].to_sym, link_to(page.title, page.full_url)
      end.join.html_safe
    end

    def cms_pages_admin_menu(*options)
      opts = options.extract_options!
      opts[:tag] ||= :li
      content_tag opts[:tag].to_sym, link_to(I18n.t('cms.pages.admin_link', :default => 'Pages'), cms_pages.admin_root_path)
    end
  end
end