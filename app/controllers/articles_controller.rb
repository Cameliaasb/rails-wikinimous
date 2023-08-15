class ArticlesController < ApplicationController
  before_action :right_article, only: [:show, :edit, :update, :destroy]

  def index
    import_articles
  end

  def show
  end

  def create
    @article = Article.create(article_params)
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def import_articles
    @articles = Article.all
  end

  def right_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
