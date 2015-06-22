require_relative '../modules/ToJson'

class Post
	include ToJson
	attr_accessor :id, :title, :tags, :description, :author

	def initialize(id, title, tags, description, author)
		@id = id
		@title = title
		@tags = tags
		@description = description
		@author = author
	end

	def self.from(post)
		self.new post['id'], post['title'], post['tags'], post['description'], post['author']
	end
end