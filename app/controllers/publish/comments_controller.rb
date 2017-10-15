class Publish::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:comment][:article_id]) 
    @comment = @article.comments.build(comment_params)
    #binding.pry
    @comment.user = current_user
    @comment.save!

  end

  
  private
  def comment_params
    params.require(:comment).permit(:body)

  end
end
