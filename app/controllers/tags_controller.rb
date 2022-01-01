class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show edit update destroy ]

  # GET /tags or /tags.json
  def index
    @q = Tag.where(user: current_user).ransack(params[:q])
    @tags = @q.result.page(params[:page])
  end


  # GET /tags/new
  def new
    @tag = Tag.new(user: current_user)
  end

  # GET /tags/1/edit
  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_url, success: '問題成功建立！'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_url, notice: '問題成功更新！'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy

    redirect_to tags_url, notice: '問題已刪除！'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:title, :user_id)
    end
end
