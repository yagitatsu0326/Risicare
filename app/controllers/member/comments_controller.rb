class Member::CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.member_id = current_member.id
		@comment.post_id = @post.id
		@comment.save
		@comments = @post.comments.order(created_at: :desc)
		@post.create_notification_comment!(current_member, @comment.id)
	end
	def destroy
		@comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
		@comment.destroy!

	end

	private

		def comment_params
			params.require(:comment).permit(:body, :post_id, :member_id)
		end
end
