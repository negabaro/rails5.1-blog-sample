class Publish::ArticlesController < ApplicationController
  
  #before_action :get_user, only: [:index, :show]
  before_action :get_article, only: [:show]

  #記事一覧
  def index
    @articles = @user.articles.includes(:user, {comments: :user}).all
  end

  #記事詳細・コメント情報も必要
  def show
    @comment = Comment.new(article_id: @article.id)
  end

  private 
    def get_user
      puts "this is get_user"
      puts params[:u_id]
      puts params[:ussss_id]
      @user = User.where(user_nickname: params[:u_id]).first
    end

    def get_article
      @article = Article.includes(:user, {comments: :user}).find(params[:id])
    end

    def get_article_all
      #@article = Arti 

    end

    def get_article_my_uid

    end

    def get_comment_my_uid

    end

end
