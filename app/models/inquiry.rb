class Inquiry < ApplicationRecord

validates :name, presence: true
validates :body, presence: true, length: { maximum: 255 }
validates :email, presence: true
validates :phone_number, presence: true

end
