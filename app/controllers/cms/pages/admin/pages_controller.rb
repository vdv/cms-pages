class Cms::Pages::Admin::PagesController < Cms::Admin::ApplicationController
  unloadable
  before_filter :_get_page, :only => [:show, :edit, :update, :destroy]
  
  def index
    @pages = Cms::Page.all
  end

  def show    
  end

  def new
    @page = Cms::Page.new(params[:cms_page])
  end

  def edit
  end

  def create
    @page = Cms::Page.new(params[:cms_page])
    if @page.save
      redirect_to admin_pages_url, notice: 'Page was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @page.update_attributes(params[:cms_page])
      redirect_to admin_pages_url, notice: 'Page was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @page.destroy

    redirect_to admin_pages_url
  end

  private

  def _get_page
    @page = Cms::Page.find(params[:id])
  end
end
