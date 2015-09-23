class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :destroy,:update]
  def index
    @articles=Article.all
  end
  def show

  end
  def edit

  end
  def update
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
  def destroy
    if @article.destroy
      flash[:notice]="Article has been deleted"
      redirect_to articles_path
    end
  end
  private
  def set_article
    @article=Article.find(params[:id])
  end
   def article_params
     params.require(:article).permit(:title, :body)
   end
end
