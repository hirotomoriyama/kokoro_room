class Public::MembersController < Public::ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    # ログイン中の会員が変更
    @member.id = current_member.id
    @member.update(member_params)
    flash[:notice] = "マイページを編集しました"
    # マイページ編集後、マイページへ遷移
    redirect_to member_path(@member.id)
  end

  def unsubscribe
    # 退会確認画面を開くのはログインユーザーのみ
    @member = current_member
  end

  # アカウント削除ではなく、論理削除（データ復旧可能にするため）
  def withdraw
    @member = current_member
    # falseが有効状態、trueが退会状態
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = '退会が完了しました'
    # 退会処理後、トップページへ遷移
    redirect_to root_path
  end

  # ゲストログインの設定
  def guest_sign_in
    @member = Member.find_or_create_by!(name: 'ゲスト', email: ENV['GUEST_EMAIL']) do |member|
      member.password = SecureRandom.urlsafe_base64
    end
    sign_in @member
    flash[:notice] = 'ゲストユーザーとしてログインしました'
    redirect_to root_path
  end

  private

  # マイページ編集時、画像と文章を作成するための設定
  def member_params
    params.require(:member).permit(:image, :body)
  end
end
