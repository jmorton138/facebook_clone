class UsersController < ApplicationController
    def index
        @users = User.all
        @request = FriendRequest.new
    end
end
