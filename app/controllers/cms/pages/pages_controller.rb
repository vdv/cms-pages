module Cms::Pages  
  class PagesController < ::ApplicationController
    unloadable
    
    def show
      url = Cms::Page.normalize_url(params[:url] || '')
      @page = Cms::Page.find_by_url(url)
      render :action => 'page404'  if @page.nil?
    end

  end
end
