class Public::SessionsController < Devise::SessionsController
  # 会員ログイン後の遷移先指定
  def after_sign_in_path_for(resource)
    root_path
  end

  # 会員ログアウト後の遷移先指定
  def after_sign_out_path_for(resource)
    root_path
  end
end
