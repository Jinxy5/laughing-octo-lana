module ForumsHelper

	# move this into the forum model 
	def number_of_posts_in(forum)
		discussions = Discussion.where(forum_id: forum.id)

		number_of_posts = 0

		discussions.each do |discussion|
			number_of_posts += discussion.posts.count
		end

		number_of_posts
	end

	def last_post_in(forum)
		
		# post where discussion belongs to forum
		#discussions = Discussion.where(forum_id: forum.id)

		#Post.where(forum_id: forum.id )
	end
end
