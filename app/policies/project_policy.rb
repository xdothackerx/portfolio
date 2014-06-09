class ProjectPolicy < ApplicationPolicy
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
      @user = User.new
      @user.role = 'visitor'
    else
      @user = user
    end
      @post = post
  end

  def create?
    @user.editor?
  end

  def publish?
    @user.editor?
  end

  def modify?
    @user.editor?
  end

  def permitted_attributes
    if @user.editor?
      [:title, :tech, :image, :description]
    else
      [:tag_list]
    end
  end
end
