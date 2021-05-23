class ResponseMailer < ApplicationMailer
  # 送信先と件名の指定
  def response_mail(response)
    @response = response
    mail to: @response.advice.member.email, subject: 'あなたの投稿に返事がありました'
  end
end
