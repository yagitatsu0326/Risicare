class Member::MembersController < ApplicationController

	before_action :authenticate_member!

	def edit
		@member = Member.find(current_member.id)
	end

	def update
		@member = Member.find(current_member.id)
		if @member.update(member_params)
			redirect_to member_member_path(current_member), notice: "アカウント情報更新しました"
		else
			render "edit"
		end
	end

	def index
		@members = Member.order(created_at: :desc).page(params[:page]).per(20)
		@member_count = Member.all.count
	end

	def show
		@member = Member.find(params[:id])
		@posts = @member.posts.all.order(created_at: :desc)
		@post_count = @posts.count
		@like_count = 0
		@posts.each do |post|
			@like_count += post.likes.count
		end
	end

	private
	def member_params
		params.require(:member).permit(:image,:user_name,:introduction, :last_name, :first_name, :last_name_kana, :first_name_kana, :email )
	end
end
