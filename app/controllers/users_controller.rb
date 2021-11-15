class UsersController < ApplicationController
    
    def index

        @friends = current_user.followers
       
        #@requests = FriendRequest.where(sender_id: current_user.id, pending: true)
        @requests = current_user.sent_requests.where(pending: true)
        @users = User.all.map do |user|
            user unless current_user.followers.include?(user) || @requests.where(recipient_id: user.id).exists? || user == current_user 
        end
        @users= @users.compact
        # @request = FriendRequest.new
    end

    def show
        @user = current_user
        @posts = Post.where(author_id: params[:id])
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
