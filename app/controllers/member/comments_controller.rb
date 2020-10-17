class Member::CommentsController < ApplicationController

	before_action :authenticate_member!

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.member_id = current_member.id
		@comment.post_id = @post.id
		if @comment.save
		  @post.create_notification_comment!(current_member, @comment.id)
		end
		@comments = @post.comments.order(created_at: :desc)
	end

	def destroy
		@comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
		@comment.destroy!
	end

	private

		def comment_params
			params.require(:comment).permit(:body)
		end
end
