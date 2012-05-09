module Cms
  class Page < ActiveRecord::Base
    include ActiveSupport::Inflector

    self.table_name = 'cms_pages'

    acts_as_nested_set
    
    attr_accessible :parent_id, :url, :title, :body, :active

    before_validation :_set_default_url, :_normalize_url
    validates :title, :url, :presence => true

    scope :ordered, order('lft')
    scope :active, where(:active => true)
    scope :for_menu, ordered.active

    class << self
      def normalize_url(url)
        "/"+url.gsub(/(.*?)[\?#].*/,'\1').gsub(/^\/+(.*)/,'\1').gsub(' ','_')
      end
    end

    def full_url
      "#{Cms::Pages.url_prefix || '/'}#{self.url}"
    end

    private

    def _set_default_url
      self.url = transliterate(title.mb_chars.downcase) if self.url.blank?
    end

    def _normalize_url
      self.url = self.class.normalize_url(self.url)
    end
  end
end
