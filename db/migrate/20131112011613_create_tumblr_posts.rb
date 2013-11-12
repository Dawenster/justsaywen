class CreateTumblrPosts < ActiveRecord::Migration
  def change
    create_table :tumblr_posts do |t|
      t.string :slug
      t.string :tumblr_id
    end
  end
end
