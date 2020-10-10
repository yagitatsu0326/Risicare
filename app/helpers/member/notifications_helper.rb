module Member::NotificationsHelper
	def notification_form(notification)
		@visiter = link_to notification.notify.user_name, member_member_path(notification.notify_id), style:"font-weight: bold;"
		@your_post = link_to "あなたの投稿", member_post_path(notification.post_id), style:"font-weight: bold;"
		case notification.action
			when "like" then
				"#{@visiter}が#{@your_post}にいいねしました"
			when "comment" then
				comment = Comment.find_by(id: notification.comment_id)
				@comment = comment.body
				"#{@visiter}が#{@your_post}にコメントしました"
		end
	end

	def unchecked_notifications
		@notifications = current_member.passive_notifications.where(checked: false)
	end
end
