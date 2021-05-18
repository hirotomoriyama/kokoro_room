class Public::ProblemsController < Public::ApplicationController
  def index
    @problems = Problem.all
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    # ログイン中の会員が投稿
    @problem.member_id = current_member.id
    if @problem.save
      flash[:notice] = '悩み事を投稿しました'
      # 悩み事投稿後、トップページ（マイページ）へ遷移
      redirect_to root_path
    else
      flash.now[:alert] = '項目を入力してください'
      # 悩み事投稿失敗後、悩み事投稿画面へ遷移
      render :new
    end
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.update(problem_params)
      flash[:notice] = "ベストアンサーを決定しました"
      # ベストアンサー決定後、同ページへ遷移
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    flash[:notice] = "悩み事を削除しました"
    # 悩み削除後、トップページ（マイページ）へ遷移
    redirect_to root_path
  end

  private

  # 悩み投稿時、タイトルと本文を入力、カテゴリーを選択するための設定
  def problem_params
    params.require(:problem).permit(:title, :body, :category_id, :best_answer_id)
  end
end
