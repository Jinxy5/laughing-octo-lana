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
          class: 'mugshot'
        }.merge!(a)

  		if image.nil?
  			image_tag 'fallbackmugshot.gif', class: o[:class], width: o[:width], height: o[:height]
  		else
        image_tag image.file_name, class: o[:class], width: o[:width], height: o[:height]
  		end
  	end
  


   def maintain_format(instring, outstring)
#      outstring.titleize if instring.is_capitalized?
      
      instring_array = instring.split(//)
      outstring_array = outstring.split(//)

      both_arrays = instring_array.zip(outstring_array)
      
      both_arrays.each do |character|

        if character[0] == nil || character[0].is_lowercase?
          
          character[1].downcase! if character[1]

        elsif character[0].is_uppercase?

          character[1].upcase! if character[1]

        end
      end
      
      outstring_array.join("")
   end	 

#   context_tax( user, 'Your')
   # id is the content 
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
