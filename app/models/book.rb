class Book < ActiveRecord::Base
  before_save :create_slug

  def create_slug
    self.slug = self.to_slug if self.title.parameterize
  end

  def to_slug
    self.title.parameterize
  end

  def percentage_read
    (self.pages_read.to_f / self.total_pages * 100).ceil
  end
end