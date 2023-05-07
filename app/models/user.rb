class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true, length: { maximum: 255 }
  validates :user_name,
            uniqueness: true,
            length: { maximum: 15 },
            presence: true
end
