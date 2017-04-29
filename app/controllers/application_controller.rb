class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  
  
   # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
  # Confirms an admin user.
    def admin_user
     redirect_to(root_url) unless current_user.admin?
     end
     def moderator_user
     redirect_to(root_url) unless current_user.moderator?
     end
    def trusty_user
     redirect_to(root_url) unless current_user.trusty?
     end
  
  
  
  
end
