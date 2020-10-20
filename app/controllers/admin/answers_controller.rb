class Admin::AnswersController < ApplicationController

	before_action :authenticate_admin!

	def new
		@answer = Answer.new
		@question = Question.find(params[:question_id])
	end

	def create
			@question = Question.find(params[:answer][:question_id])
			@answer = Answer.new(answer_params)
			@answer.admin_id = current_admin.id
			@answer.question_id = @question.id
			if @answer.save
				redirect_to admin_answers_path, notice: "回答作成しました"
			else
				render 'new'
			end
	end

	def index
		@questions = Question.all.order(created_at: :desc)
		@answered = Answer.where(question_id: @questions)
		@unanswered = @questions.count - @answered.count
	end

	def show
		@answer = Answer.find(params[:id])
	end

	def edit
		@answer = Answer.find(params[:id])
		@question = @answer.question
	end

	def update
		@answer = Answer.find(params[:id])
		if @answer.update(answer_params)
			redirect_to admin_answers_path, notice: "回答を更新しました"
		else
			@answer = Answer.find(params[:id])
			@question = @answer.question
			render  'edit'
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to admin_answers_path, notice: "質問を削除しました"
	end

	private
	def answer_params
		params.require(:answer).permit(:body, :question_id)
	end
end
