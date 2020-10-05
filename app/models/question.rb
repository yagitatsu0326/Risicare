class Question < ApplicationRecord
	belongs_to :members, optional: true
end
