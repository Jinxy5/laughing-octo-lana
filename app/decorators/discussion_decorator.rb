class DiscussionDecorator < ApplicationDecorator
  delegate_all

  def is_current_user?
    h.current_user ? true : false
  end

  def is_admin?
    h.current_user.is_admin? if is_current_user?
  end

  def is_owner?
    h.current_user === model.author if is_current_user?
  end

  def is_visitor?
   !is_owner? || !is_admin? ? true : false if is_current_user?
  end

  def is_owner_or_admin?
    is_admin? || is_owner? ? true : false if is_current_user?
  end
  
  def is_guest?
    !is_current_user?
  end

  def is_follower?
    model.followers.exists?(user_id: h.current_user.id)# ? true : false
  end





  def decorate_follow_message
   	contextual_custom(
                      visitor_message: is_follower? ? h.link_to('Stop following this discussion', h.delete_follower_forum_discussion_path(model.forum, model)) : h.link_to('Follow this discussion', h.create_follower_forum_discussion_path(model.forum, model)),
                      admin_message: is_follower? ? h.link_to('Stop following this discussion', h.delete_follower_forum_discussion_path(model.forum, model)) : h.link_to('Follow this discussion', h.create_follower_forum_discussion_path(model.forum, model))
                      )
  end



  def decorate_follower_information(follower)
  	case model.user
  	when follower
  		'- discussion creator'
  	end

#  	"#{model.user} #{follower}"
  end



end
