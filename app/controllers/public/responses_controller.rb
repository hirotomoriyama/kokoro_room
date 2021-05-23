class Public::ResponsesController < Public::ApplicationController
  def new
    @response = Response.new
    @advice = Advice.find(params[:advice_id])
  end

  def create
    @response = Response.new(response_params)
    # ログイン中の会員が返事を投稿
    @response.member_id = current_member.id
    # 返事に対する回答の指定
    @response.advice_id = params[:advice_id]
    if @response.save
      # メール送信の実行
      ResponseMailer.response_mail(@response).deliver
      flash[:notice] = '返事を投稿しました'
      # 返事投稿後、悩み事詳細画面に遷移
      redirect_to problem_path(@response.advice.problem_id)
    else
      @response = Response.new(response_params)
      @advice = Advice.find(params[:advice_id])
      flash.now[:alert] = "項目を入力してください"
      # 返事投稿失敗後、返事投稿画面へ遷移
      render :new
    end
  end

  def destroy
    response = Response.find(params[:advice_id])
    response.destroy
    flash[:notice] = "返事を削除しました"
    # 返事削除後、同じ画面に遷移
    redirect_back(fallback_location: root_path)
  end

  private

  # 返事投稿時、返事の内容を投稿するための設定
  def response_params
    params.require(:response).permit(:body, :rate)
  end
end
