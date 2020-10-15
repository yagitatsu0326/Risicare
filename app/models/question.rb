class Question < ApplicationRecord
	belongs_to :member
	has_one :answer, dependent: :destroy

	validates :body, presence: true
end
