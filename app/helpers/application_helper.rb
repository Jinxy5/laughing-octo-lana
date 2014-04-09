module ApplicationHelper
	def page_title(title)
		full_title = 'Blood Bikes Wales | ' + title
  		full_title.strip!
  		content_for :title, full_title
  	end


  	def show_uploaded_image(image, a ={})
      o = {
          height: 70,
          width: 70
        }.merge!(a)
  		if image.nil?
  			image_tag 'fallbackmugshot.gif', class: 'mugshot', width: o[:width] 
  		else
        image_tag image.file_name, class: 'mugshot', width: o[:width]
  		end
  	end
	
end
