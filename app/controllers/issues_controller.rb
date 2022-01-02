class IssuesController < ApplicationController
  before_action :set_issue, only: %i[ edit update destroy ]

  def index
    @q = Issue.where(user: current_user).ransack(params[:q])
    @issues = @q.result.page(params[:page])
  end

  def new
    @issue = Issue.new(user: current_user)
  end

  def edit
  end

  def create
    @issue = Issue.new(issue_params)

    if @issue.save
      redirect_to issues_url, success: '問題成功建立！'
    else
      flash.now[:error] = @issue.errors.messages.join(',')
      render :new
    end
  end

  def update
    if @issue.update(issue_params)
      redirect_to issues_url, notice: '問題成功更新！'
    else
      flash.now[:error] = @issue.errors.messages.join(',')
      render :edit
    end
  end

  def destroy
    @issue.destroy

    redirect_to issues_url, notice: '問題已刪除！'
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:title, :content, :priority, :status, :started_at, :finished_at, :user_id, :tag_list)
    end
end
