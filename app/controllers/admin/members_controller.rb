class Admin::MembersController < ApplicationController

	before_action :authenticate_admin!

	def index
		@members = Member.all
		@member_count = @members.count
	end
end
