class Notification < ApplicationRecord

	belongs_to :like, optional: true
	belongs_to :post, optional: true
	belongs_to :comment, optional: true
	belongs_to :notify, class_name:"Member", foreign_key:"notify_id", optional: true
	belongs_to :notified, class_name:"Member", foreign_key:"notified_id", optional: true

end
