def create_forum(name, description, allowed_roles)


	forum = Forum.create( name: name, description: description )
	forum.allow_role('rider')
end
