class Public::ResponsesController < Public::ApplicationController

  def new
    @response = Response.new
    @advice = Advice.find(params[:advice_id])
  end

  def create
    response = Response.new(response_params)
    # ログイン中の会員が返事を投稿
    response.member_id = current_member.id
    # 返事に対する回答の指定
    response.advice_id = params[:advice_id]
    response.save
     # 返事投稿後、悩み事詳細画面に遷移
    redirect_to problem_path(response.advice.problem_id)
  end

  def destroy
  end

  private

  # 返事投稿時、返事の内容を投稿するための設定
  def response_params
    params.require(:response).permit(:body)
  end

end
