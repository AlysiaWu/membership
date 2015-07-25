class MembershipsController < ApplicationController
	before_action :require_login
	before_action :require_correct_user

	 def create 
	 	Membership.create(member:current_user, group:Group.find(params[:group_id]))
		redirect_to "/groups/#{params[:group_id]}"
	 end 

	 def destroy
	 	Membership.find_by(member: Member.find(session[:user_id]), group: Group.find(params[:group_id])).destroy
		redirect_to "/groups/#{params[:group_id]}"

	 end
end
