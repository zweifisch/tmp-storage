
getTimestamp = ->
	Math.floor 0.001 * +new Date

getSeconds = (timeStr)->
	return 0 unless timeStr?
	dict =
		secs:1
		sec:1
		mins:60
		min:60
		hours:3600
		hour:3600
		days: 86400
		day: 86400
	[_,time,unit] = timeStr.match /([0-9.]+)([a-z]+)/i
	if unit of dict
		dict[unit] * parseFloat time
	else
		0

class TmpStorage

	constructor: (@prefix)->
		@load()

	load:->
		try
			@data = JSON.parse localStorage.getItem @prefix
		@data = {} unless typeof @data is 'object' and @data?
		@expires = @data.__expires ? {} 

	flush:->
		localStorage.setItem @prefix,JSON.stringify @data

	clearExpiredValues: =>
		now = getTimestamp()
		dirty = false
		for own key, time of @expires
			if time <= now
				console.log time,now, now-time
				dirty = true
				delete @expires[key]
				delete @data[key]
		if dirty then @flush()

	setItem: (key, value, expire)=>
		@data[key] = value
		if expire?
			@expires[key] = getTimestamp() + getSeconds expire
		@flush()

	getItem: (key)=>
		@clearExpiredValues()
		@data[key]

	getExpiration: (key)=>
		@expires[key]

	dispose: ->
		# localStorage.clear

@TmpStorage = TmpStorage
