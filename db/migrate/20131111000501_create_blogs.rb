class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :slug
      t.string :image
      t.text :body
      t.string :posted_at
    end
  end
end
