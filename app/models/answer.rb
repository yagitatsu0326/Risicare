class Answer < ApplicationRecord
	belongs_to :question, optional: true
	belongs_to :admin

	validates :body, presence: true
end
