class Private::ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destory]
  
  def index

  end

  def show
    puts "this is show"
    puts @article.title
    puts @article.body_source

  end

  def new
    @article = Article.new

  end

  def edit

  end

  def create
    #@article = Article.new(article_params)
    #@article = current_user.articles(article_params)
    @article = current_user.articles.build(article_params)
    
    @article.save!

    redirect_to @article
    #show

  end

  def update

    @article.assign_attributes(article_params)
    if @article.valid?
      @article.save!
    else
      render 'edit'
    end

  end

  def destroy
    @article.destroy
    redirect_to article_path

  end

  private

  def set_article
    puts "this is set_article"
    @article = Article.find(params[:id])
    puts @article
    puts @article.title
  end

  def article_params
   params.require(:article).permit(:title, :body_source) 
  end
end
