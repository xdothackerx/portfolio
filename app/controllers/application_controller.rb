class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  # after_filter :verify_authorized, :except => :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  protected

  def authenticate
    unless current_user
      redirect_to new_session_url,
        alert: 'You need to sign in or sign up to continue.'
    end
  end
end

class DashboardController < ApplicationController
  before_action :authenticate
end
