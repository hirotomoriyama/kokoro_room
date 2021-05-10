class ContactMailer < ApplicationMailer
  # 送信先と件名の指定
  def contact_mail(contact)
    @contact = contact
    mail to: ENV['TOMAIL'], subject: 'お問い合わせ内容'
  end
end
