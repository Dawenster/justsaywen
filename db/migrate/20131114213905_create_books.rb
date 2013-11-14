class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :slug
      t.string :image
      t.string :author
      t.text :review
      t.integer :total_pages
      t.integer :pages_read

      t.timestamps
    end
  end
end
