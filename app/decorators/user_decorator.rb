class UserDecorator < ApplicationDecorator
  delegate_all

      def is_current_user?
        h.current_user ? true : false
      end

      def is_admin?
        h.current_user.is_admin? if is_current_user?
      end

      def is_owner?
        h.current_user === model if is_current_user?
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




    def contextual_owner(owner_message, args={})
      o = {
        visitor_message: owner_message.assimilate(model.user_name) + '\'s'
      }.merge!(args)


      contextual_custom( owner_message: owner_message,
                         visitor_message: o[:visitor_message],
                         guest_message: o[:visitor_message],
                         admin_message: o[:visitor_message] )

  #    contextual_custom(o[:visitor_message], owner_message, o[:visitor_message])

    end

    def contextual_empty_message(information, args={})
      o = {
        auto_attribute: false,
        visitor_empty_message: model.user_name + ' has chosen not to share this information.',
        owner_empty_message: h.link_to('Click here to update your info!', h.edit_user_path),
        admin_empty_message: h.link_to('Click here to update' + model.user_name + '\'s information', h.edit_user_path),
        visitor_information_message: information,
        owner_information_message: information,
        admin_information_message: information,   
        considered_empty: [nil,'', 0] 
      }.merge!(args)

      ap o[:considered_empty]

      if o[:considered_empty].include?(information)        
        contextual_custom( owner_message: o[:owner_empty_message], admin_message: o[:admin_empty_message], visitor_message: o[:visitor_empty_message], guest_message: o[:visitor_empty_message] )
      else
        
     
        contextual_custom( owner_message: o[:owner_information_message], admin_message: o[:admin_information_message], visitor_message: o[:visitor_information_message], guest_message: o[:visitor_information_message] )

      end

    end

    def contextual_custom(args={})
      o = {
        owner_message: 'message',
        admin_message: 'message',
        visitor_message: 'message',
        guest_message: 'message'
      }.merge!(args)

      case
      when is_owner?
        o[:owner_message]
      when is_admin?
        o[:admin_message]
      when is_visitor?
        o[:visitor_message]
      when is_guest?
        o[:guest_message]
      end

    end



  def most_popular_forum
    record = 0

    model.allowed_forums.each do | forum |
      forum.name
    end

  end

  def decorate_user_name
   contextual_empty_message( model.user_name, visitor_empty_message: "#{model.user_name} has chosen to not enter a user_name.",
                                                   admin_empty_message: h.link_to("#{model.user_name} has not entered a user_name. If you know this information, you can click here to enter it yourself.", h.edit_user_path(model) ),
                                                   owner_empty_message: h.link_to("You haven't entered a user_name. Click here to enter it!", h.edit_user_path(model) ) )    
  end


  def decorate_public_email
   contextual_empty_message( model.public_email, visitor_empty_message: "#{model.user_name} has chosen to not enter a public email.",
                                                   admin_empty_message: h.link_to("#{model.user_name} has not entered a public email. If you know this information, you can click here to enter it yourself.", h.edit_user_path(model) ),
                                                   owner_empty_message: h.link_to("You haven't entered a public email. Click here to enter it!", h.edit_user_path(model) ) )  
  end

  def decorate_discussion_count
    contextual_empty_message( model.discussions.count, visitor_empty_message: 'None!',
                                                       admin_empty_message: 'None!',
                                                       owner_empty_message: h.content_tag('aright') + h.link_to("You haven't started any discussions! Why not click here to start one now?", h.forums_path ) )  
  end

  def decorate_replies_count
    contextual_empty_message( model.discourses.count, visitor_empty_message: 'None!',
                                                      admin_empty_message: 'None!',
                                                      owner_empty_message: h.link_to("You haven't replied to any discussions! Why click here not reply to the most popular discussion relevent to your roles?", h.forum_discussion_path(model.most_popular_discussion.forum, model.most_popular_discussion) ) )  
  end

  def decorate_state
   contextual_empty_message( model.state, visitor_empty_message: "#{model.user_name} is unregistered",
                                          admin_empty_message: "#{model.user_name} is unregistered",
                                          owner_empty_message: h.link_to("You haven't registered! Check your email for a registration email and follow the instructions enclosed! Click here to send another registration email", h.send_registration_email_path(model.id) ),
                                          considered_empty: [nil, "","unregistered"] )
  end


  # private information start
  def decorate_private_info
    h.render 'private_info' if is_owner_or_admin?  #is_visitor?
  end


  def decorate_first_name     
    contextual_empty_message( model.first_name, visitor_empty_message: 'None!',
                                                       admin_empty_message: h.link_to("#{model.user_name} has not entered a first name. If you know this information, you can click here to enter it yourself.", h.edit_user_path(model) ),
                                                       owner_empty_message: h.link_to("You haven't entered a first name. Click here to enter it!", h.edit_user_path(model) ) )  
  end


  def decorate_last_name
    contextual_empty_message( model.last_name, visitor_empty_message: 'None!',
                                                       admin_empty_message: h.link_to("#{model.user_name} has not entered a last name. If you know this information, you can click here to enter it yourself.", h.edit_user_path(model) ),
                                                       owner_empty_message: h.link_to("You haven't entered a last name. Click here to enter it!", h.edit_user_path(model) ) )
  end

  def decorate_email
    contextual_empty_message( model.email, visitor_empty_message: 'None!',
                                                       admin_empty_message: h.link_to("#{model.user_name} has not entered an email. If you know this information, you can click here to enter it yourself.", h.edit_user_path(model) ),
                                                       owner_empty_message: h.link_to("You haven't entered an email. Click here to enter it!", h.edit_user_path(model) ) )
  end

  def decorate_address 
    contextual_empty_message( model.address, visitor_empty_message: 'None!',
                                                       admin_empty_message: h.link_to("#{model.user_name} has not entered an address. If you know this information, you can click here to enter it yourself.", h.edit_user_path(model) ),
                                                       owner_empty_message: h.link_to("You haven't entered an address. Click here to enter it!", h.edit_user_path(model) ) )
  end

  def decorate_landline
    contextual_empty_message( model.landline, visitor_empty_message: 'None!',
                                                       admin_empty_message: h.link_to("#{model.user_name} has not entered a landline. If you know this information, you can click here to enter it yourself.", h.edit_user_path(model) ),
                                                       owner_empty_message: h.link_to("You haven't entered a landline. Click here to enter it!", h.edit_user_path(model) ) )

  end

  def decorate_mobile
    contextual_empty_message( model.mobile, visitor_empty_message: 'None!',
                                                       admin_empty_message: h.link_to("#{model.user_name} has not entered a mobile. If you know this information, you can click here to enter it yourself.", h.edit_user_path(model) ),
                                                       owner_empty_message: h.link_to("You haven't entered an mobile. Click here to enter it!", h.edit_user_path(model) ) )
  end
 



  def decorate_nearest_town
    contextual_empty_message( model.nearest_town, visitor_empty_message: 'None!',
                                                       admin_empty_message: h.link_to("#{model.user_name} has not entered a nearest town. If you know this information, you can click here to enter it yourself.", h.edit_user_path(model) ),
                                                       owner_empty_message: h.link_to("You haven't entered a nearest town. Click here to enter it!", h.edit_user_path(model) ) )

  end

  def decorate_post_code
    contextual_empty_message( model.postcode, visitor_empty_message: 'None!',
                                                       admin_empty_message: h.link_to("#{model.user_name} has not entered a post code. If you know this information, you can click here to enter it yourself.", h.edit_user_path(model) ),
                                                       owner_empty_message: h.link_to("You haven't entered a postcode. Click here to enter it!", h.edit_user_path(model) ) )

  end
  # private information end







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
