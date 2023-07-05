class DisksController < ApplicationController
  before_action :set_current_user, :set_disk

  def upload_files
    if params[:disk][:files].present?

      params[:disk][:files].each do |file|
        if @disk.files.attach(file)
          redirect_to @user, notice: 'file was successfully uploaded.'
        else
          redirect_to @user, notice: @disk.errors.messages
        end
      end
    end
  end

  def delete_files
    ActiveStorage::Attachment.find(params[:id]).purge
    redirect_to @user, notice: 'file was successfully deleted.'
  end

  private

  def set_current_user
    @user = current_user
  end

  def set_disk
    @disk = Disk.find_or_create_by(user_id: @user.id)
  end

end
