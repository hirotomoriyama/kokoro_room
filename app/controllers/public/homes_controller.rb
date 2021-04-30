class Public::HomesController < Public::ApplicationController
  def top
    if member_signed_in?
      @member = current_member
      @problems = @member.problems
    end
  end

  def about
  end

  # ゲストログインの設定
  def new_guest
    member = Member.find_or_create_by(email: 'guest@example.com') do |member|
      # 安全性のため、パスワードはランダム生成
      member.password = SecureRandom.urlsafe_base64
      # メール確認機能でユーザー認証を行ったことにする設定
      member.confirmed_at = Time.now
    end
    sign_in member
    # ログイン後はトップページへ遷移
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
  end
end
