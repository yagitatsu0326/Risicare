module Member::NotificationsHelper
	def notification_form(notification)
		@comment = nil
		@visiter = link_to notification.notify.user_name, member_member_path(notification.notify_id)
		@your_post = link_to "あなたの投稿", member_post_path(notification.post_id)#, remote: true
		case notification.action
			when "like" then
				"#{@visiter}が#{@your_post}にいいねしました"
				#{}"どなたからいいねきましたよ"
			when "comment" then
				#"どなたからかコメントきましたよ!"
				@comment = Comment.find_by(id: notification.comment_id)&.body
				"#{@visiter}が#{@your_post}にコメントしました"
		end
	end

	def unchecked_notifications
		@notifications = current_member.passive_notifications.where(checked: false)
	end
end
