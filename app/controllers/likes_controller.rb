class LikesController < ApplicationController
    def index
        @likes = Like.all
    end

    def create
        @like = Like.new(liker_id: current_user.id)
        @post = Post.find(params[:post_id])
        if @post.likes << @like
            redirect_to root_path
        end
    end

    def destroy
        @like =  Like.find(params[:id])
        if @like.destroy
            redirect_to root_path
        end

    end

    private

    def like_params
        params.require(:like).permit(:post_id)
    end

end
