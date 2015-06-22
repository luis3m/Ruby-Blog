require 'rspec'
require_relative '../repositories/PostRepository'
require_relative '../models/Post'

describe PostRepository do
	before :context do
		@repository = PostRepository.new
	end
	
	it "should return an array of posts" do
		expect(@repository.all).to be_a Array
		expect(@repository.by_tag :edutation).to be_a Array
		expect(@repository.by_author :Luis).to be_a Array
	end
	
	it "should return a single post when an Id is passed" do
		expect(@repository.by_id 1).to be_a Post
	end
	
	it "should return posts by author" do
		post = @repository.all.first
		posts = @repository.by_author post.author
		expect(posts).to be_a Array
		expect(posts.first).to be_a Post
	end
	
	it "should return posts by tag" do
		post = @repository.all.first
		posts = @repository.by_tag post.tags.first
		expect(posts).to be_a Array
		expect(posts.first).to be_a Post
	end
	
	it "should find a post with a numeric id" do
		expect(@repository.by_id(1).id).to eq '1'
	end
end