class AddReviewedToBooks < ActiveRecord::Migration
  def change
    add_column :books, :reviewed, :boolean
  end
end
