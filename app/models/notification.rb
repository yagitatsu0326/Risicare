class Notification < ApplicationRecord
	belongs_to :likes, optional: true
	belongs_to :posts, optional: true
	belongs_to :comments, optional: true
end
