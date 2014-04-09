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
	
end
