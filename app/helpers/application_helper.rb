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
  			return image_tag 'fallbackmugshot.gif', class: o[:class], width: o[:width], height: o[:height] if o[:for] == :user
        return image_tag '7.jpg', class: o[:class], width: 800, height: 504 if o[:for] == :story
  
      else       
        return image_tag "#{image.file_name}", class: o[:class], width: o[:width], height: o[:height] == :user

      #  return image_tag "#{image.file_name}", class: o[:class], width: 800, height: 504 if 0[:for] == :story
  		end
  	end
    
    def find_fields(name)
      @fields = Page.find_by(name: name.to_s).fields 
    end

    def dynamic_content(name)
      @fields.find { |field| field[:name] == name.to_s }.content
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
