class InquirySend < ApplicationMailer
  def send_admin_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@mentalulu.com',
      to:   ENV['ADMIN_EMAIL'],
      subject: 'お問い合わせ通知'
    )
  end
end
