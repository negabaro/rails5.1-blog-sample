class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def new
    @article = Article.new
  end

  def index

  end

  def show
    @comment = Comment.new(article_id: @article.id)

  end

  def edit
    
  end

  def update
    #@article.assign_attributes(article_params)
    @article.assign_attributes(article_params)
    #@article.attributes(article_params)
    if @article.valid?
      @article.save!
      flash[:success] = "記事を更新しました。"
      redirect_to @article
    else
      render :edit
    end
  end

  def create
    #params[:title]
    #@article
    @article = Article.new(article_params)
    @article.save!   

    flash[:success] = '記事を公開しました。'
    #redirect_to [:articles, @article]
    #redirect_to @article, notice: '記事を公開しました!'
    #redirect_to action: 'index', controller: 'articles'
    #redirect_to acontroller: 'articles', action: 'show' << error
    redirect_to @article
    

  end

  def destroy
    @article.destroy
    
    flash[:success] = "記事を削除しました。"
    redirect_to articles_path
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :body_source)
  end

  def set_article
   @article = Article.find(params[:id]) 
   puts @article
  end
end
