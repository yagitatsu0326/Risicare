class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy

  has_many :active_notifications, class_name:"Notification", foreign_key:"notify_id", dependent: :destroy
  has_many :passive_notifications, class_name:"Notification", foreign_key:"notified_id", dependent: :destroy

  attachment :image

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :user_name, presence: true, uniqueness: true, format: { with: /\A[A-Za-z]\w*\z/ }
  validates :introduction ,presence: true, length: { maximum: 255 }

end
