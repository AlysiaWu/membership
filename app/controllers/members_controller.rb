class MembersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

def create
	m=Member.create(first_name:params[:first_name], last_name:params[:last_name], email:params[:email],password:params[:password])
	if m.errors.any?
		flash[:error]=m.errors.full_messages
		redirect_to '/main'
	else 
		session[:user_id]=m.id
		redirect_to '/groups'
	end
end

end
