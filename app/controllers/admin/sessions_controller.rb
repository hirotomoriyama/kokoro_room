class Admin::SessionsController < Devise::SessionsController
  # 管理者ログイン後の遷移先指定
  def after_sign_in_path_for(resource)
    admin_path
  end

  # 管理者ログアウト後の遷移先指定
  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
end
