class Notification < ActionMailer::Base
  default from: "from@example.com"
  
  def new_user_notification(user)
    @user = user

    mail(to: 'membership@bloodbikeswales.org.uk',
         from: "thebloodbikeswalesrobot@gmail.com",
         subject: "New User has signed up!"
        )

  end
end
