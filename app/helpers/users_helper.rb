module UsersHelper

  def show_disk_space
    if @user.disk.present?
      Disk::DISK_LIMIT - @user.disk.files.map(&:byte_size).sum
    else
      Disk::DISK_LIMIT
    end
  end

  def file_name_without_ext(file)
    filename = file.filename.to_s
    File.basename(filename, File.extname(filename))
  end

end
