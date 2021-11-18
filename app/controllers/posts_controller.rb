class PostsController < ApplicationController

    def index
        @like = Like.new
        #@likes = current_user.likes
        @likes = Like.all
        @comment = Comment.new
        @post = Post.new
        @posts = current_user.followees.map do |friend|
            friend.authored_posts
        end
        @posts = @posts.compact.flatten
        Post.where(author_id: current_user.id).each do |post|
            @posts << post
        end
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
        params.require(:post).permit(:body, :photo)
    end
end
