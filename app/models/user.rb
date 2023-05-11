class User < ApplicationRecord

  has_many_attached :files

  #set maximum available disk space in megabytes (10Mb)
  DISK_LIMIT = 10.megabytes.freeze

  #set maximum maximum file size in megabytes (10Mb)
  MAX_FILE_SIZE = 4.megabytes.freeze

  #set available extentions
  PERMITTED_EXTENTIONS = %w[zip, xlsx, docx].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true, length: { maximum: 255 }

  validates :user_name,
            uniqueness: true,
            length: { maximum: 15 },
            presence: true

  validates_format_of :user_name, with: /\A[a-zA-Z0-9_]{2,15}\Z/ ,
                      message: 'User name must be Alphanumeric',
                      multiline: true

  validates_format_of :password,
                      with: /^(?=.*[A-z])(?=.*[0-9])(?=.*[!@#$%!?`~^&*()\-__+.]).{8,30}$/,
                      multiline: true,
                      message: 'Password should have more than 8 and smolder 30 characters,
                                including uppercase letters,
                                numbers and special character'

end
