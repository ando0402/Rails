class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @articles = Article.find(params[:id])
  end

  def new
    @articles = Article.new
  end

  # def create
  #   @article = Article.new(title: "...", body : "...")

  #   if @articles.save
  #     redirect_to @article
  #   else @articles.save
  #     render * :new, status: :unprocessable_entity
  #   end
  # end

end
