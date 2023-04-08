class UsersController < ApplicationController
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
    binding.pry
    if @user.update(user_params)
    binding.pry
      flash[:notice] = "編集が完了しました。"
      redirect_to show_account_user_path(current_user)
    else
      render 'edit'
    end
  end

  private
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