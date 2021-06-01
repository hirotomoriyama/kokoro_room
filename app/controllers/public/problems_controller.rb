class Public::ProblemsController < Public::ApplicationController
  def index
    option = params['option']
    @problems = search_for(option)
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
    # 悩み事の投稿者がログインユーザーと一致していれば、削除可能
    if @problem.member_id == current_member.id
      @problem.destroy
      flash[:notice] = "悩み事を削除しました"
      # 悩み事削除後、トップページ（マイページ）へ遷移
      redirect_to root_path
    end
  end

  private

  # 悩み投稿時、タイトルと本文を入力、カテゴリーを選択するための設定
  def problem_params
    params.require(:problem).permit(:title, :body, :category_id, :best_answer_id)
  end

  def search_for(option)
    # 全て表示の場合
    if option == "all"
      Problem.all
    # 回答受付中の場合
    elsif option == "unsolved"
      @members = Member.where(is_deleted: false)
      Problem.where(best_answer_id: nil, member_id: @members.ids)
    # 解決済みの場合
    elsif option == "solved"
      @members = Member.all
      Problem.where.not(best_answer_id: nil).where(member_id: @members.ids)
    # 回答受付終了の場合
    elsif option == "finished"
      @members = Member.where(is_deleted: true)
      Problem.where(best_answer_id: nil, member_id: @members.ids)
    # 未選択の場合
    else
      Problem.all
    end
  end
end
