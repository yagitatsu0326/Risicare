class Member::PostsController < ApplicationController

	before_action :authenticate_member!

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.member_id = current_member.id
		if @post.save
			redirect_to member_member_path(current_member), notice: "投稿されました"
		else
			render "new"
		end
	end

	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comments = @post.comments.order(created_at: :desc)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to member_post_path(@post.id), notice: "投稿内容更新されました"
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to member_member_path(current_member)
	end


	private
	def post_params
		params.require(:post).permit(:image,:body)
	end
end
