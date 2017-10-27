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
    if @article.valid?
      @article.save!
      case params[:ope][:cmd]
      when 'publish'
        @article.publish!
        puts "hi this is publish zone"
        flash[:success] = '記事を公開しました。'
      when 'save'
        #@article.draft!
        puts "hi this is draft zone"
        flash[:success] = '記事を保存しました。'
      else
        raise
      end
      redirect_to @article
    else
      redirect_to :new
    end
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

  def run_publish
    @article.publish?
    flash[:success] = '記事を公開しました!'
    redirect_to @article
  end

  def run_draft
    @article.draft?
    flash[:success] = '記事を下書きしました!'
    redirect_to @article
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
