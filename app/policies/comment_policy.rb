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
    true
  end

  def publish?
    @user.editor?
  end

  def modify?
    @user.editor? || @user == @comment.author
  end

  def permitted_attributes
    if @user.editor? || @user.owner_of?(@comment)
      [:title, :body, :tag_list]
    else
      [:tag_list]
    end
  end
end
