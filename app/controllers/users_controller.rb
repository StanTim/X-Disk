class UsersController < ApplicationController
  before_action :set_current_user, except: [:show, :create]
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @disk = Disk.find_by(params[@user.id])
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      @disk = Disk.create(user_id: @user.id)
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'devise/registration/new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'user was successfully updated.'
    else
      render :show
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed.'
  end

  private

  def set_current_user
    # @user = User.find(params[:id])
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:user_name, :email)
  end
end
