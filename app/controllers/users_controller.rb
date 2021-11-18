class UsersController < ApplicationController
    
    def index
        @friends = current_user.followers
        @requests = FriendRequest.where(recipient_id: current_user.id, pending: true)
        @sent_requests = current_user.sent_requests.where(pending: true)
        @received_requests = current_user.received_requests.where(pending: true)
        @users = User.all.map do |user|
            user unless current_user.followers.include?(user) || @sent_requests.where(recipient_id: user.id).exists? || @received_requests.where(sender_id: user.id).exists? ||user == current_user 
        end
        @users= @users.compact
        # @request = FriendRequest.new
    end

    def show
        @likes = Like.all
        @user = User.find(params[:id])
        @posts = Post.where(author_id: params[:id]).order(created_at: :desc)
        @requests = FriendRequest.where(recipient_id: current_user.id, pending: true)

    end

    def edit
        @user = current_user
        @requests = FriendRequest.where(recipient_id: current_user.id, pending: true)

    end

    def update
        @user = current_user
        @user.avatar.attach(params[:avatar])
        if @user.update(user_params)
            redirect_to @user
        else
            render :show
        end
    end

    def user_params
        params.require(:user).permit(:avatar)
    end
end
