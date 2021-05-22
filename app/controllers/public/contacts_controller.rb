class Public::ContactsController < Public::ApplicationController
  before_action :authenticate_member!, except: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # メール送信の実行
      ContactMailer.contact_mail(@contact).deliver
      flash[:notice] = 'お問い合わせ内容を送信しました'
      # 問い合わせ内容投稿後、トップページ（マイページ）へ遷移
      redirect_to root_path
    else
      flash.now[:alert] = '項目を入力してください'
      # 問い合わせ内容投稿失敗後、問い合わせフォームへ遷移
      render :new
    end
  end

  private

  # 問い合わせ内容の投稿時、名前、本文、メールアドレスを入力するための設定
  def contact_params
    params.require(:contact).permit(:name, :body, :email)
  end
end
