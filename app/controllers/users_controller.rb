class UsersController < ApplicationController
  before_action :set_current_user, except: [:show]
  before_action :authenticate_user!

  def new
    @user = User.new
  end


  def create
    @user = User.new

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'devise/registration/new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render 'devise/registration/edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed.'
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.permit(:user_name, :email)
  end
end
