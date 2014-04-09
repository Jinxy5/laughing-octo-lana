module ApplicationHelper
	def page_title(title)
		full_title = 'Blood Bikes Wales | ' + title
  		full_title.strip!
  		content_for :title, full_title
  	end


  	def show_uploaded_image(image)
  		if image.nil?
  			image_tag 'fallbackmugshot.gif'
  		else
        image_tag image.file_name
  		end
  	end
	
end
