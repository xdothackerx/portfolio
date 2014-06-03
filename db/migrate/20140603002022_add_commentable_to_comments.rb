class AddCommentableToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer

    Comment.all.each do |c|
      c.commentable_id = c.post_id
      c.commentable_type = "post"
    end

    remove_column :comments, :post_id
  end
end
