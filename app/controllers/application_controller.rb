class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  private
  def current_user
    @current_user = User.where(id: session[:user_id]).first rescue nil
  end

  helper_method :current_user
end
