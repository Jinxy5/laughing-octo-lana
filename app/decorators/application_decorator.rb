class ApplicationDecorator < Draper::Decorator
	delegate_all

	  def contextual_custom(args={})
	    
	    o = {
	      owner_message: 'owner',
	      admin_message: 'admin',
	      visitor_message: 'visitor',
	      guest_message: 'guest'
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

end
