class Member::LikesController < ApplicationController

	before_action :authenticate_member!

	def create
		@post = Post.find(params[:post_id])
		@like = current_member.likes.new(post_id: @post.id)
		@like.save
		@post.create_notification_by(current_member)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@like = current_member.likes.find_by(post_id: @post.id)
		@like.destroy
	end

end
