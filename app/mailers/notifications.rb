class Notifications < ActionMailer::Base
  default from: 'contact@acidit.com'

  def contact_us_mail(user_email, message)
    @user_email, @message = user_email, message

    subject = t('.subject', user: @user_email, locale: :en)

    mail subject: subject, to: 'everton.carpes@gmail.com',
      reply_to: @user_email
  end
end
