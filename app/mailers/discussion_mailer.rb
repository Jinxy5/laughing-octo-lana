class DiscussionMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.discussion_mailer.new_reply_notification.subject
  #
  def new_reply_notification(user, reply, discussion, forum)
    @user = user
    @reply = reply
    @forum = forum
    @discussion = discussion

    mail(to: user.email,
         from: "thebloodbikeswalesrobot@gmail.com"
        # subject: "#{@reply_user.user_name} has just replied to #{discussion.op.user_name}'s discussion, #{@discussion.name}"
        )

  end

end
