class Public::AdvicesController < Public::ApplicationController
  def new
    @advice = Advice.new
    @problem = Problem.find(params[:problem_id])
  end

  def create
    @advice = Advice.new(advice_params)
    # ログイン中の会員が回答を投稿
    @advice.member_id = current_member.id
    # 回答に対する悩み事の指定
    @advice.problem_id = params[:problem_id]
    if @advice.save
      flash[:notice] = '回答を投稿しました'
      # 回答投稿後、悩み事詳細画面に遷移
      redirect_to problem_path(@advice.problem_id)
    else
      @advice = Advice.new(advice_params)
      @problem = Problem.find(params[:problem_id])
      flash.now[:alert] = '項目を入力してください'
      # 回答投稿失敗後、回答投稿画面へ遷移
      render :new
    end
  end

  def destroy
    @advice = Advice.find(params[:problem_id])
    @advice.destroy
    flash[:notice] = "回答を削除しました"
    # 回答削除後、同じ画面に遷移
    redirect_back(fallback_location: root_path)
  end

  private

  # 回答投稿時、回答の内容を投稿するための設定
  def advice_params
    params.require(:advice).permit(:body)
  end
end
