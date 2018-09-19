class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username,uniqueness: true, length: { in: 2..20 }
  validates :profile_intro,    length: { maximum: 50 }, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  attachment :profile_image

end
