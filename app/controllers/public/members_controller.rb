class Public::MembersController < Public::ApplicationController
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
end
