class CommentsController < ApplicationController
    def create
        comm_pars = comment_params
        comm_pars[:commenter] = current_user.username
        comm_pars[:user_id] = current_user.id
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comm_pars)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), status: :see_other
      end
    
    private
    def comment_params
        params.require(:comment).permit(:text)
    end
end
