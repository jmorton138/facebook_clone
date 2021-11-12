class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.commenter_id = current_user.id
        @post = Post.find(params[:post_id])
        if @post.comments << @comment
            redirect_to root_path
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to root_path
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end
end
