require 'sinatra'
require './extensions/ArrayExtension'
require './repositories/PostRepository'

posts = PostRepository.new

set :port, 8080

get '/api/posts' do
	posts.all.to_json_array
end

get '/api/posts/byId/:id' do |id|
	posts.by_id(id).to_json
end

get '/api/posts/byAuthor/:author' do |author|
	posts.by_author(author).to_json_array
end

get '/api/posts/byTag/:tag' do |tag|
	posts.by_tag(tag).to_json_array
end

get '/api/tags/byPost/:id' do |id|
	tags = {}
	posts.by_id(id).tags.each { |tag| tags[tag] = posts.by_tag(tag).length }
	tags.to_json
end

get '/*' do
	send_file "public/views/index.html"
end