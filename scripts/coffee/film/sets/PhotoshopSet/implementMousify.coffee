Mousify = require './tools/Mousify'

module.exports = (film) ->

	m = new Mousify film.sets.photoshop.cursor, film, 'Mouse', 'Mousify', [

		() -> return {x: window.innerWidth * .5, y: window.innerHeight * .5},

		() -> return {x: - window.innerWidth * .5 + 430, y: - window.innerHeight * .5 + 20 }

	]
