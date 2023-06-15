class UsersController < ApplicationController
  before_action :set_q, only:[:index, :search]

  def index
    @users = User.all
    @user = current_user
  end

  def show_account
    @user = current_user
  end

  def show_profile
    @user = current_user
  end

  def edit_account
    @user = User.find(params[:id])
  end

  def edit_profile
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集が完了しました。"
      redirect_to show_account_user_path(@user, current_user)
    else
      render 'edit'
    end
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @users = User.all
    @rooms = Room.all
    @q = User.ransack(params[:q])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :encrypted_password,
      :profile_image,
      :name,
      :profile
    )
  end

end