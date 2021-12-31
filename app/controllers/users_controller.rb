require 'securerandom'

class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create login sign_in]

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to issues_url, notice: '建立帳號成功！'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @user.destroy
  #
  #   redirect_to users_url, notice: "User was successfully destroyed."
  # end
  #
  def sign_in
    if current_user.present?
      redirect_to issues_url
    end
  end

  def sign_out
    session.delete(:user_id)
    redirect_to root_url
  end

  def login
    user = User.find_by(account: user_params[:account])
    if user.present? && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to issues_url
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:account, :password, :name)
  end
end
