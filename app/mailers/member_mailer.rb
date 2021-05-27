class MemberMailer < ApplicationMailer
  # 退会時のメールの送信先と件名の指定
  def member_mail(member)
    @member = member
    mail to: @member.email, subject: '退会完了のお知らせ'
  end

  # 管理者が会員ステータスを変更時のメールの送信先と件名の指定
  def status_mail(member)
    @member = member
    # ステータスが有効となった場合
    if @member.is_deleted == false
      mail to: @member.email, subject: 'アカウント復旧のお知らせ'
    # ステータスが退会となった場合
    elsif @member.is_deleted == true
      mail to: @member.email, subject: 'アカウント凍結のお知らせ'
    end
  end
end
