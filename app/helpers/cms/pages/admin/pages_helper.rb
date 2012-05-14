module Cms::Pages::Admin
  module PagesHelper
    def options_for_pages
      [['','']] + nested_set_options(Cms::Page, @page) {|i| "#{'-' * i.level} #{i.title}" }
    end

    def wyminit
      links = Cms::Page.roots.map do |root|
        root.self_and_descendants.map do |i|
          {:name => "#{'&nbsp;'*i.level}#{i.title}", :url => i.full_url}
        end
      end.flatten.compact
      render :file => 'wymeditor_init.html.haml', :locals => {:links => links}
    end    
  end
end
