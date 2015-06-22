require 'json'

class DbContext
	def all(collection)
		JSON.parse(File.read './collections/%s.json' % collection)
	end
end