class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  def require_user
    redirect_to '/users/sign_in' unless current_user
  end
end
