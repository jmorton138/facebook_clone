class UsersController < ApplicationController
    def index
        @users = User.all
        @request = FriendRequest.new
        @requests = FriendRequest.where(recipient_id: current_user.id, pending: true)
    end

    def show
        @user = current_user
    end
end
