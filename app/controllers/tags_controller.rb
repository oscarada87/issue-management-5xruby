class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show edit update destroy ]

  def index
    @q = Tag.where(user: current_user).ransack(params[:q])
    @tags = @q.result.page(params[:page])
  end

  def new
    @tag = Tag.new(user: current_user)
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_url, success: '標籤成功建立！'
    else
      flash.now[:error] = @tag.errors.messages.join(',')
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_url, notice: '標籤成功更新！'
    else
      flash.now[:error] = @tag.errors.messages.join(',')
      render :edit
    end
  end

  def destroy
    @tag.destroy

    redirect_to tags_url, notice: '標籤已刪除！'
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:title, :user_id)
    end
end
