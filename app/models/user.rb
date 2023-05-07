class User < ApplicationRecord

  validates :email, uniqueness: true, length: { maximum: 255 }
  validates :user_name,
            uniqueness: true,
            length: { maximum: 15 },
            presence: true
end
