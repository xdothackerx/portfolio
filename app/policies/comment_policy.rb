class CommentPolicy < ApplicationPolicy
  class Scope
    def resolve
      if @user.editor?
        scope.all
      else
        scope.where(:approved => true)
      end
    end
  end

  def initialize(user, comment)
    if user.nil?
      @user = User.new(:role => 'visitor')
    else
      @user = user
    end
      @comment = comment
  end

  def create?
    @user
  end

  def publish?
    @user.editor?
  end

  def modify?
    @user.editor? || user == @comment.author || @user.id == Post.find(@comment.post_id).author_id
  end

  def permitted_attributes
    if @user.editor? || @user.author?
      [:content, :commentable_id, :author, :tag_list, :approved]
    else
      [:content, :commentable_id, :author, :tag_list]
    end
  end
end
