class ArticlesController < ApplicationController
  # CRUD
  # Show ALL
  def index
    @articles = Article.all
  end

  # Show ONE
  def show
    @article = Article.find(params[:id])
  end

  # Create NEW
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  # UPDATE existing
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path
  end

  # DELETE
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
