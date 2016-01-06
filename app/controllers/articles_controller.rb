class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])  This has been commented out in favor of the before action below the class definition
  end

  def update
    #@article = Article.find(params[:id]) This has been commented out in favor of the before action below the class definition

    if @article.update(article_params())
      flash[:notice] = "Article was successfully updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create
    #render plain: params[:article].inspect  This has been commented out in favor of the before action below the class definition

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
    #@article = Article.find(params[:id])   This has been commented out in favor of the before action below the class definition
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy

    flash[:notice] = "article was successufully deleted."
    redirect_to articles_path
  end


  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params()
      params.require(:article).permit(:title, :description)
    end
end
