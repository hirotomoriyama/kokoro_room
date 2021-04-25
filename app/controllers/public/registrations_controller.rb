class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 会員新規登録後の遷移先
  def after_sign_up_path_for(resource)
    root_path
  end

  # 会員新規登録時、ニックネームを入力するための設定
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
