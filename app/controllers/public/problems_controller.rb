class Public::ProblemsController < Public::ApplicationController

  def index
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    @problem.save
    # 悩み投稿後、トップページ（マイページ）へ遷移
    redirect_to root_path
  end

  def show
  end

  def destroy
  end

  private

  # 悩み投稿時、タイトルと本文を入力するための設定
  def problem_params
    params.require(:problem).permit(:title, :body)
  end

end
