class Answer < ApplicationRecord
	belongs_to :members, optional: true
	belongs_to :admins, optional: true
end
