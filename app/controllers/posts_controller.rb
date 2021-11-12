class PostsController < ApplicationController

    def index
        @like = Like.new
        @likes = current_user.likes
        @comment = Comment.new
        @posts = Post.all
        @post = Post.new
        @requests = FriendRequest.where(recipient_id: current_user.id, pending: true)
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        if @post.save
            redirect_to root_path
        end
    end

    private

    def post_params
        params.require(:post).permit(:body)
    end
end
