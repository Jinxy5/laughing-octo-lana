class UserDecorator < ApplicationDecorator
  delegate_all

 # decorates :user

#  include SessionsHelper

  def is_admin?
    h.current_user.is_admin?
  end

  def is_owner?
    h.current_user === model
  end

  def is_visitor?
   !is_owner? || !is_admin? ? true : false
  end

  def is_owner_or_admin?
    is_admin? || is_owner? ? true : false
  end

  def contextual_owner(owner_message, args={})
    o = {
      visitor_message: owner_message.assimilate(model.user_name) + '\'s'
    }.merge!(args)

    is_owner? ? owner_message : o[:visitor_message]
  end

  def contextual_empty_message(information, args={})
    o = {
      visitor_empty_message: model.user_name + ' has chosen not to share this information.',
      owner_empty_message: h.link_to('Click here to update your info!', h.edit_user_path), 
      admin_empty_message: h.link_to('Click here to update' + model.user_name + '\'s information', h.edit_user_path),
      considered_empty: nil 
    }.merge!(args)

    return information unless information == o[:considered_empty]

    case 
    when is_owner?
      o[:owner_empty_message]
    when is_admin?
      o[:admin_empty_message]  
    when is_visitor?
      o[:visitor_empty_message]   
    end

  end

  def most_popular_forum
    record = 0

    model.allowed_forums#.each do | forum |
      
#      ap forum 
 #   end
  end

  def decorate_user_name
    contextual_empty_message( read_attribute (:user_name) )
  end

  def decorate_public_email
    contextual_empty_message( read_attribute (:public_email), visitor_empty_message: "@{model.user_name} has chosen not to share a public email." )
  end

  def decorate_discussion_count
    contextual_empty_message( model.discourses.count, visitor_empty_message: 'None!',
                                                      admin_empty_message: 'None!',
                                                      owner_empty_message: h.link_to( h.link_to("You haven't started any discussions! Why not click here to start one now?", h.forums_path )),
                                                      considered_empty: 0 )  
  end

  def decorate_replies_count
    contextual_empty_message( model.posts.count, visitor_empty_message: 'None!',
                                                   admin_empty_message: 'None!',
                                                   owner_empty_message: h.link_to( h.link_to("You haven't replied to any discussions! Why not reply to the most popular discussion relevent to your roles?", h.forums_path )),
                                                   considered_empty: 0 )  
  end


#  def contextual_owner(owner_message, another)
#    current_user.id == model.id ? owner_message : owner_message.assimilate(model.user_name) + '\'s'
#  end

=begin
  def contextual_message(message, another_user, an_admin)
    current_user.id == user.id ? internal_message : external_message
  end

  def private_info_context
    contextualize 'yourself and select admins', model.first_name  + ' and admins'
  end

  def no_data_message(attribute, data_message, no_data_message)
    data = model.read_attribute(attribute)
    
    data.is_nil? ? 'please input this data' : data 
  end

  def first_name
  	model.first_name + 'Yea yea'
  end

  def 

  def landline 
  end

  # h = all helpers
  # m = the model

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
=end
end
