require 'securerandom'

class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create login sign_in]
  before_action :set_user, only: %i[ edit update destroy ]

  def show
  end

  def new
    @user = User.new
  end

  def index
    redirect_to(root_url, alert: '沒有權限') unless current_user_admin?

    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to issues_url, notice: '建立帳號成功！'
    else
      flash.now[:alert] = @user.errors.messages.join(',')
      render :new
    end
  end

  def update
    if @user.id != current_user.id
      redirect_to root_url, alert: '沒有權限'
    elsif @user.update(user_params)
      redirect_to user_url(@user), notice: '使用者更新成功'
    else
      flash.now[:alert] = @user.errors.messages.join(',')
      render :edit
    end
  end

  def destroy
    if current_user.id == @user.id || (current_user_admin? && @user.role.name == 'user')
      @user.destroy
      redirect_to users_url, notice: '使用者已成功刪除'
    else
      redirect_to root_path, alert: '沒有權限'
    end
  end

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
      redirect_to root_url, alert: '登入失敗，請檢查帳號密碼是否正確。'
    end
  end

  private

  def user_params
    params.require(:user).permit(:account, :password, :name).merge(role_id: Role.find_by(name: 'user').id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
