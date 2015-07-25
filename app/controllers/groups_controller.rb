class GroupsController < ApplicationController
	
	before_action :require_login, only: [:index, :create, :destroy]
	def index
		# @user=Member
		@groups=Group.all
	end

	def create
		g = Member.find(params[:user_id]).groups.create(name:params[:name], description:params[:description])
		

		if g.errors.any?
		flash[:error]=g.errors.full_messages
		redirect_to "/groups"
		else
			Membership.create(member:current_user, group:g)
			redirect_to "/groups"
		end
	end
  
	def show 
		@members = []
		@group=Group.find(params[:id])
		members=@group.members_joined
		members.each do |m|
		@members << m.first_name + " "+m.last_name
		end 

	end






	def destroy
		group = Group.find(params[:id])
		group.destroy if group.member == current_user
		redirect_to '/groups' 
	end

end
