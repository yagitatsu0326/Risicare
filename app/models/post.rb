class Post < ApplicationRecord

	belongs_to :member
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

	attachment :image

	def liked_by?(member)
		likes.where(member_id: member.id).exists?
	end

	def create_notification_by(current_member)
		#メンバーがいいねした時の通知をnotificationテーブルに登録
		notification = current_member.active_notifications.new(
			notified_id: member_id,
			post_id: id,
			action: "like"
		)
		#自分の投稿に対してのいいねは無効にする
		if notification.notify_id == notification.notified_id
			notification.checked = true
		end
		notification.save if notification.valid?
	end

	def create_notification_comment!(current_member, comment_id)
		#自分以外のコメントしたユーザに対してコメントしたことを通知する
		temp_ids = Comment.select(:member_id).where(post_id: id).where.not(member_id: current_member.id).distinct
		temp_ids.each do |temp_id|
			save_notification_comment!(current_member, comment_id, temp_id["member_id"])
		end
		#まだ誰も通知していない時、投稿者に通知を送る
		save_notification_comment!(current_member, comment_id, member_id) if temp_ids.blank?
	end

	def save_notification_comment!(current_member, comment_id, notified_id)
		#一つの投稿に複数回通知する
		notification = current_member.active_notifications.new(
			notified_id: member_id,
			post_id: id,
			comment_id: comment_id,
			action: "comment"
		)
		if notification.notify_id == notification.notified_id
			notification.checked = true
		end
		notification.save if notification.valid?
	end
end
