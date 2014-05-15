module ApplicationHelper
	def page_title(title)
		full_title = 'Blood Bikes Wales | ' + title
  		full_title.strip!
  		content_for :title, full_title
  	end


  	def show_uploaded_image(image, a ={})
      o = {
          height: 70,
          width: 70,
          for: :user,
          class: 'mugshot'
        }.merge!(a)

  		if image.nil?
  			image_tag 'fallbackmugshot.gif', class: o[:class], width: o[:width], height: o[:height] if o[:for] == :user
        image_tag 'fallbackmugshot2.gif', class: o[:class], width: o[:width], height: o[:height] if o[:for] == :story
  
      else       
        image_tag "#{image.file_name}", class: o[:class], width: o[:width], height: o[:height]
  		end
  	end
  

   def context_tag(model, string, args={})
    o = {
      attribute: :user_name
    }.merge!(args)

    if current_user.id == model.id 
      content_tag maintain_format(string, 'your')
    else
      content_tag maintain_format(string, model.read_attribute(o[:attribute]) )
    end
  end

end
