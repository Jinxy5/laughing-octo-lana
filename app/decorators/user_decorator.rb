class UserDecorator < Draper::Decorator
  delegate_all

  decorates :user

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

end
