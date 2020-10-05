class Like < ApplicationRecord
	has_many :notifications, dependent: :destroy
	belongs_to :members, optional: true
	belongs_to :posts, optional: true
end
