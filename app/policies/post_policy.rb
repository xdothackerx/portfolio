class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
      # if user.editor?
      #   scope.all
      # else
      #   scope.where(:published => true)
      # end
    end
  end

  def create?
    user.editor? or user.author?
  end

  def publish?
    user.editor?
  end

  def edit?
    user.editor? or not post.published?
  end

  def destroy?
    user.editor or user.author?
  end

  def permitted_attributes
    if user.admin? || user.owner_of?(post)
      [:title, :body, :tag_list]
    else
      [:tag_list]
    end
  end
end
