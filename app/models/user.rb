class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username,uniqueness: true, length: { minimum: 2, maximum: 20 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy

  # deviseでemailを不必要にする
  def email_required?
  	false
  end
  def email_changed?
  	false
  end

end
