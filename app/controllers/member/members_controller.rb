class Member::MembersController < ApplicationController

	def edit
		@member = Member.find(current_member.id)
	end

	def update
		@member = Member.find(current_member.id)
		if @member.update(member_params)
			redirect_to member_member_path(current_member)
		else
			@member = Member.find(current_member.id)
			render "edit"
		end
	end

	def index
		@members = Member.all
	end

	def show
		@member = Member.find(params[:id])

	end




	private
	def member_params
		params.require(:member).permit(:image,:user_name,:introduction)
	end
end
