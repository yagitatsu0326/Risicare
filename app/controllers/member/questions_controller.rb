class Member::QuestionsController < ApplicationController

	before_action :authenticate_member!

	def new
		@question = Question.new
		@member = current_member
	end

	def create
		@question = Question.new(question_params)
		@question.member_id = current_member.id
		@member = current_member.id
		if @question.save
			redirect_to member_questions_path, notice: "質問を送信しました"
		else
			@member = current_member
			render 'new'
		end
	end

	def index
		@questions = Question.all.order(created_at: :desc)

	end

	def show
		@question  = Question.find(params[:id])
		@answer = @question.answer
	end

	private
	def question_params
		params.require(:question).permit(:body)
	end

end
