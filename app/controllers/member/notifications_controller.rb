class Member::NotificationsController < ApplicationController

	before_action :authenticate_member!

	def index
		@notifications = current_member.passive_notifications.order(created_at: :desc).page(params[:page]).per(10)
		@notifications.where(checked: false).each do |notification|
			notification.update_attributes(checked: true)
		end
	end
end
