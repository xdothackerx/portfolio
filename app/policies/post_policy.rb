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
    if user.nil?
      @user = User.new(:role => 'visitor')
    else
      @user = user
    end
    @post = post
  end

  def create?
    @user.editor? or @user.author?
  end

  def publish?
    @user.editor?
  end

  def edit?
    @user.editor? || @user == @post.author
  end

  def destroy?
    @user.editor? || @user == @post.author
  end

  def permitted_attributes
    if @user.editor? || @user.owner_of?(@post)
      [:title, :body, :tag_list]
    else
      [:tag_list]
    end
  end
end
