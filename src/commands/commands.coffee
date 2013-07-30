class commandsCommand extends Command
	init: ->
		@command='!commands'
		@parseType='exact'
		@rankPrivelege='user'

	functionality: ->
		allowedUserLevels = []
		user = API.getUser(@msgData.fromID)
		window.capturedUser = user
		if user.permission > 5
			allowedUserLevels = ['user','mod','host']
		else if user.permission > 2
			allowedUserLevels = ['user','mod']
		else
			allowedUserLevels = ['user']
		msg = ''
		for cmd in cmds
			c = new cmd('')
			if c.rankPrivelege in allowedUserLevels
				if typeof c.command == "string"
					msg += c.command + ', '
				else if typeof c.command == "object"
					for cc in c.command
						msg += cc + ', '
		msg = msg.substring(0,msg.length-2)
		API.sendChat msg
		
