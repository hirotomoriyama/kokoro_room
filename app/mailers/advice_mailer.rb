class AdviceMailer < ApplicationMailer
  # 送信先と件名の指定
  def advice_mail(advice)
    @advice = advice
    mail to: @advice.problem.member.email, subject: 'あなたの投稿に回答がありました'
  end
end
