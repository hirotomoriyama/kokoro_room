class Public::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # LINEログインの導入
  def line; basic_action end

  private

  def basic_action
    @omniauth = request.env['omniauth.auth']
    # LINEアカウントのプロバイダーとUIDがあれば取得
    pp request.env['omniauth.auth']
    if @omniauth.present?
      @profile = Member.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
      # memberモデルで作成したレコードがあればログイン
      if @profile
        @profile.set_values(@omniauth)
        sign_in(:member, @profile)
      # 無ければ新規作成
      else
        @profile = Member.new(provider: @omniauth['provider'], uid: @omniauth['uid'])
        email = @omniauth['info']['email']? @omniauth['info']['email'] : "#{@omniauth['uid']}-#{@omniauth['provider']}@example.com"
        @profile = current_member || Member.create!(provider: @omniauth['provider'], uid: @omniauth['uid'], email: email, name: @omniauth['info']['name'], password: Devise.friendly_token[0, 20])
        @profile.set_values(@omniauth)
        sign_in(:member, @profile)
      end
    end
    flash[:notice] = "ログインしました"
    redirect_to root_path
  end

  # 仮メールアドレスの作成
  def fake_email(uid, provider)
    return '#{auth, uid}-#{auth.provider}@example.com'
  end
end
