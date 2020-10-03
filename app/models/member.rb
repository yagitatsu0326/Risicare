class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destory
  has_many :likes, dependent: :destory
  has_many :comments, dependent: :destory
  has_many :questions, dependent: :destory
  has_many :answers, dependent: :destory
end
