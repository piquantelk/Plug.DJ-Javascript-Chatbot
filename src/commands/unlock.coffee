class unlockCommand extends Command
	init: ->
		@command='!unlock'
		@parseType='exact'
		@rankPrivelege='mod'

	functionality: ->
		data.unlockBooth()
