class Post < ApplicationRecord

	belongs_to :member
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy
	has_many :tags, dependent: :destroy

	attachment :image

	validates :body, presence: true, length: { maximum: 255 }
	validates :image, presence: true


	def liked_by?(member)
		#いいね済かの判別
		likes.where(member_id: member.id).exists?
	end

	def create_notification_by(current_member)
		#メンバーがいいねした時の通知をnotificationテーブルに登録
		notification = current_member.active_notifications.new(
			notified_id: member_id,
			post_id: id,
			action: "like"
		)
		#自分の投稿に対してのいいねの通知は無効
		if notification.notify_id == notification.notified_id
			notification.checked = true
		end
		notification.save if notification.valid?
	end

	def create_notification_comment!(current_member, comment_id)
		#会員がコメントした時の通知をnotificationテーブルに登録
		notification = current_member.active_notifications.new(
			notified_id: member_id,
 			post_id: id,
			comment_id: comment_id,
			action: "comment"
		)
		#自分の投稿に対してのコメントの通知は無効
		if notification.notify_id == notification.notified_id
			notification.checked = true
		end
		notification.save if notification.valid?
	end
end
