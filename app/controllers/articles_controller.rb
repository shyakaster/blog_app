class ArticlesController < ApplicationController
  def index
    @articles=Article.all
  end
  def show
   @article= Article.find(params[:id])
  end
  def edit
    @article=Article.find(params[:id])
  end
  def update
    @article=Article.find(params[:id])
    if @article.update(article_params)
      flash[:success]="Article was updated"
      redirect_to @article
    else
      flash[:danger]="Article failed to update"
      render :edit
    end
  end
  def new
    @article=Article.new
  end
  def create
    @article=Article.new(article_params)
    if @article.save
      flash[:success]="Article has been created"
      redirect_to articles_path
    else
      flash.now[:danger]="Sorry article not saved"
      render :new
    end
  end
  private
   def article_params
     params.require(:article).permit(:title, :body)
   end
end
