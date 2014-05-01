class StoryDecorator < ApplicationDecorator
  def decorate_state
  	ap model
  	case model.state
  	when 'disapproved'
  		
  		h.link_to 'disapproved'

  	when 'approved'
		h.link_to model.approve_date
  	end
  end

end
