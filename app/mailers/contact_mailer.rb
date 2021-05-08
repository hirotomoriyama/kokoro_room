class ContactMailer < ApplicationMailer
  # 送信先と件名の指定
  def send_mail(contact)
    @contact = contact
    mail to: ENV['TOMAIL'], subject: '問い合わせ内容'
  end
end
