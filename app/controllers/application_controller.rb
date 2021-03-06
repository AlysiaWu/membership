class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 def current_user 

  	Member.find(session[:user_id]) if session[:user_id]
  end 

  helper_method :current_user 
  
def require_login
		redirect_to '/main' if session[:user_id] == nil
	end

	def require_correct_user
		member = Member.find(current_user)
		redirect_to "/groups" if current_user != member
	end


end
