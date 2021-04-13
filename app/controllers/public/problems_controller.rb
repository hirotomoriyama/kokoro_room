class Public::ProblemsController < Public::ApplicationController

  def index
    @problems = Problem.all
  end

  def new
    @problem = Problem.new
    @categories = Category.all
  end

  def create
    problem = Problem.new(problem_params)
    # ログイン中の会員が投稿
    problem.member_id = current_member.id
    problem.save
    # 悩み投稿後、トップページ（マイページ）へ遷移
    redirect_to root_path
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    # 悩み削除後、トップページ（マイページ）へ遷移
    redirect_to root_path
  end

  private

  # 悩み投稿時、タイトルと本文を入力、カテゴリーを選択するための設定
  def problem_params
    params.require(:problem).permit(:title, :body, :category_id)
  end

end
