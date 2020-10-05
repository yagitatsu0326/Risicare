class Post < ApplicationRecord
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :members, optional: true
end
