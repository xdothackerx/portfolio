class PostPolicy < ApplicationPolicy
  class Scope
    def resolve
      if @user.editor?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    @user.editor? or @user.author?
  end

  def publish?
    @user.editor?
  end

  def edit?
    @user.editor? || @user.owner_of?(@post)
  end

  def destroy?
    @user.editor? || @user.owner_of?(@post)
  end

  def permitted_attributes
    if @user.editor? || @user.owner_of?(@post)
      [:title, :body, :tag_list]
    else
      [:tag_list]
    end
  end
end
