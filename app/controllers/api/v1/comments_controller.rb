class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]

  def index
    comments = Comment.all.page params[:page]

    if comments
      render json: comments, status: :ok
    else
      render json: comments.errors, status: :not_found
    end
  end

  def show
    if @comment
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :bad_request
    end
  end

  def search
    comments = Article.find(params[:article_id]).comments

    render json: comments, status: :ok
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :bad_request
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :bad_request
    end
  end

  def destroy
    if @comment.destroy
      render json: { message: 'Destroyed comment successfully' }, status: :ok
    else
      render json: comment.errors, status: :bad_request
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :date_of_comment, :article_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
