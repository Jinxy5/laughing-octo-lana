class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.discussion_mailer.new_reply_notification.subject
  #
  def registration(user)
    @user = user

    mail(to: user.email,
         from: "thebloodbikeswalesrobot@gmail.com",
         subject: "Register to bloodbikeswales.com"
        )

  end

end
