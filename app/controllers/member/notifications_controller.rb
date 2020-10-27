class Member::NotificationsController < ApplicationController

	before_action :authenticate_member!

	def index
		@notifications = current_member.passive_notifications.order(created_at: :desc).page(params[:page]).per(20)
		#checkカラムがfalseのデータを一覧表示する
		@notifications.where(checked: false).each do |notification|
			#表示後checkカラムをtrueに更新
			notification.update_attributes(checked: true)
		end
	end

	def destroy_all
		@notifications = current_member.passive_notifications.all
		if @notifications.destroy_all
			redirect_to member_notifications_path
		end
	end
end
