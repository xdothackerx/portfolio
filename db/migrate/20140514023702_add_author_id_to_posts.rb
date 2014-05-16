class AddAuthorIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author_id, :integer
    add_column :posts, :post_id, :integer
    add_index :posts, :published
  end
end
