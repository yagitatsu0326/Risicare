class Admin::MembersController < ApplicationController

	before_action :authenticate_admin!

	def index
		@members = Member.order(created_at: :desc).page(params[:page]).per(20)
		member = Member.all
		@member_count = member.count
	end
end
