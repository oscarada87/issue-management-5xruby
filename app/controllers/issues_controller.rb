class IssuesController < ApplicationController
  before_action :set_issue, only: %i[ show edit update destroy ]

  # GET /issues or /issues.json
  def index
    @q = Issue.where(user: current_user).ransack(params[:q])
    @issues = @q.result.page(params[:page])
  end


  # GET /issues/new
  def new
    @issue = Issue.new(user: current_user)
  end

  # GET /issues/1/edit
  def edit
  end

  def create
    @issue = Issue.new(issue_params)

    if @issue.save
      redirect_to issues_url, success: '問題成功建立！'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /issues/1 or /issues/1.json
  def update
    if @issue.update(issue_params)
      redirect_to issues_url, notice: '問題成功更新！'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /issues/1 or /issues/1.json
  def destroy
    @issue.destroy

    redirect_to issues_url, notice: '問題已刪除！'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:title, :content, :priority, :status, :started_at, :finished_at, :user_id)
    end
end
