class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else @article.save
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = @article .find(params[:id])
  end

  def update
    @article = @article.find(params[:id])

    if @articel.update(@article_params)
      redirect_to @article
    else
      render :edit , status: :unprocessable_entity
    end

  end

  private
    def article_params
      params.require(:articel).permit(:title, :body)
    end

end
