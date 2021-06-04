class Public::MembersController < Public::ApplicationController
  def show
    @member = current_member
    @problems = @member.problems
    @solved_problems = Problem.where.not(best_answer_id: nil).where(member_id: @member.id)
    @unsolved_problems = Problem.where(best_answer_id: nil, member_id: @member.id)
  end

  def edit
    @member = current_member
    @problems = @member.problems
    @solved_problems = Problem.where.not(best_answer_id: nil).where(member_id: @member.id)
    @unsolved_problems = Problem.where(best_answer_id: nil, member_id: @member.id)
  end

  def update
    @member = current_member
    @member.update(member_params)
    flash[:notice] = "マイページを編集しました"
    # マイページ編集後、マイページへ遷移
    redirect_to members_my_page_path
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
    # メール送信の実行
    MemberMailer.member_mail(@member).deliver
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
