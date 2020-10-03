class Genre < ApplicationRecord
	has_many :informations, dependent: :destroy
end
