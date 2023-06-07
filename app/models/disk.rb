class Disk < ApplicationRecord

  belongs_to :user
  has_many_attached :files

  # set maximum available disk space in megabytes (10Mb)
  DISK_LIMIT = 10.megabytes.freeze

  # set maximum maximum file size in megabytes (4Mb)
  MAX_FILE_SIZE = 4.megabytes.freeze

  # set available extentions
  PERMITTED_EXTENTIONS = ['application/zip',
                          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                          'application/vnd.openxmlformats-officedocument.wordprocessingml.document'].freeze

  before_validation :free_disk_space

  validates :files,
            size: { less_than: MAX_FILE_SIZE,
                    message: "size more than #{ActionController::Base.helpers.number_to_human_size(MAX_FILE_SIZE)}" },
            content_type: { in: PERMITTED_EXTENTIONS,
                            message: "support only docx, xlsx, zip" }

  validate :enough_disk_space

  private

  def free_disk_space
    DISK_LIMIT - files_blobs.sum(:byte_size)
  end

  def enough_disk_space
    if files.attached?
      if files.blobs.last.byte_size > free_disk_space
        files.blobs.last.destroy
        errors.add(:files, "Disk limit exceeded #{ActionController::Base.helpers.number_to_human_size(DISK_LIMIT)}")
      end
    end
  end
end
