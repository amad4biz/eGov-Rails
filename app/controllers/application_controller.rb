class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_user
    redirect_to '/users/sign_in' unless current_user
  end
end
