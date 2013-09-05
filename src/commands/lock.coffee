class lockCommand extends Command
	init: ->
		@command='!lock'
		@parseType='exact'
		@rankPrivelege='mod'

	functionality: ->
		data.lockBooth()
