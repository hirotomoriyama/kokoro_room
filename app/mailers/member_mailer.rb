class MemberMailer < ApplicationMailer
  # 送信先と件名の指定
  def member_mail(member)
    @member = member
    mail to: @member.email, subject: '退会完了のお知らせ'
  end
end
