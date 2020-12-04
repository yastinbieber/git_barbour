class InquiryMailer < ActionMailer::Base
  default from: "yastin.bieber6@gmail.com"   # 送信元アドレス
  default to: "yastin.bieber6@gmail.com"     # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => '【要確認】お問い合わせを承りました')
  end
end