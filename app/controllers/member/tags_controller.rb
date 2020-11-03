class Member::TagsController < ApplicationController

  def show
  	@tag = Tag.find(params[:id])
  	@tags = Tag.where(name: @tag.name).order(created_at: :desc).page(params[:page]).per(18)
	@search = Tag.ransack(params[:q])
  end

  def index
	@search = Tag.ransack(params[:q])
	tags = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(20)
	@tags = tags.select(:post_id).distinct
  end
end
