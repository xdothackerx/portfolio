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
    @user = user
    @comment = comment
  end

  def create?
    @user
  end

  def publish?
    @user && @user.editor?
  end

  def modify?
    @user && @user.editor? || @user && @user == @comment.author
  end

  def permitted_attributes
    if @user && @user.editor? || @user && @user.owner_of?(@comment)
      [:content, :post_id, :author_email, :tag_list, :approved]
    else
      [:content, :post_id, :author_email, :tag_list]
    end
  end
end
