class IssuesController < ApplicationController
  before_action :set_issue, only: %i[ show edit update destroy ]

  # GET /issues or /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1 or /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  def create
    @issue = Issue.new(issue_params)

    if @issue.save
      format.html { redirect_to issues_url, success: '問題成功建立！' }
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /issues/1 or /issues/1.json
  def update
    if @issue.update(issue_params)
      format.html { redirect_to issue_url(@issue), notice: '問題成功更新！' }
    else
      format.html { render :edit, status: :unprocessable_entity }
    end
  end

  # DELETE /issues/1 or /issues/1.json
  def destroy
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url, notice: '問題已刪除！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:title, :content, :priority, :status, :started_at, :finished_at)
    end
end
