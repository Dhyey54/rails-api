class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index
    articles = Article.all.page params[:page]

    if articles
      render json: articles, status: :ok
    else
      render json: articles.errors, status: :not_found
    end
  end

  def show
    if @article
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :bad_request
    end
  end

  def search
    articles = Article.where("title LIKE ?", "%#{params[:title]}%")

    render json: articles, status: :ok
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: article.errors, status: :bad_request
    end
  end

  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :bad_request
    end
  end

  def destroy
    if @article.destroy
      render json: { message: 'Destroyed article successfully' }, status: :ok
    else
      render json: article.errors, status: :bad_request
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :release_date)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
