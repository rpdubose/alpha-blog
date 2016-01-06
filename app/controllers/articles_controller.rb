class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params())
      flash[:notice] = "Article was successfully updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create
    #render plain: params[:article].inspect

   # @article.save
   # redirect_to articles_path(@article)
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article Was Successfully Saved."
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params()
      params.require(:article).permit(:title, :description)
    end
end
