class Book < ActiveRecord::Base
  before_create :create_slug

  def create_slug
    self.slug = self.to_slug
  end

  def to_slug
    self.title.parameterize
  end
end