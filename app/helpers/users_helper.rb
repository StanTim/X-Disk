module UsersHelper

  def show_disk_space
    User::DISK_LIMIT - @user.files.map(&:byte_size).sum
  end

end
