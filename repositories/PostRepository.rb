require_relative '../context/DbContext'
require_relative '../models/Post'

class PostRepository
	def initialize
		@posts = DbContext.new.all(:posts)['posts'].map { |obj| Post.from obj }
	end

	def all
		@posts
	end

	def by_id(id)
		@posts.detect { |post| post.id == id.to_s }
	end

	def by_author(author)
		@posts.select { |post| post.author == author }
	end

	def by_tag(tag)
		@posts.select { |post| post.tags.include? tag }
	end
end