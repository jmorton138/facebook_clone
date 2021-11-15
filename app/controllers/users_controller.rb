class UsersController < ApplicationController
    def index
        @users = User.all
        @request = FriendRequest.new
        @requests = FriendRequest.where(recipient_id: current_user.id, pending: true)
    end

    def show
        @user = current_user
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
