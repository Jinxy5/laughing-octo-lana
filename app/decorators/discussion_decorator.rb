class DiscussionDecorator < ApplicationDecorator
  delegate_all

#  def

  def decorate_follow_message
 	h.current_user

 	'to watch this discussion, click here'
 	'to stop watching this discussion, click here'
 	'to view and edit this discussions watchers, click here'

  end

  def contextual_custom
 	'shooooooooooot'
  end

  def decorate_follower_information(follower)
  	case model.user
  	when follower
  		'- discussion creator'
  	end

#  	"#{model.user} #{follower}"
  end

end
