class Admin::MembersController < ApplicationController
	def index
		@members = Member.all
		@member_count = @members.count
	end
end
