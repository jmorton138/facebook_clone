class FriendRequestsController < ApplicationController

    def index
        @requests = FriendRequest.where(recipient_id: current_user.id, pending: true)

        @friends = current_user.followers
    end

    def create
        @friend_request = FriendRequest.new(sender_id: current_user.id, recipient_id: params[:recipient_id])

        if @friend_request.save
            redirect_to root_path
        end

    end

    def accept
        @request = FriendRequest.find(params[:id])
        @request.pending = false
        @request.save
        # create friend association
        @requester = User.find(@request.sender_id)
        followed = Friendship.new(follower_id: @request.sender_id, followee_id: current_user.id)
        following = Friendship.new(follower_id: current_user.id, followee_id: @request.sender_id)
        if followed.save && following.save
            redirect_to friend_requests_path
        else
            render :friend_requests_path
        end
        
    end

    def reject
        @request = FriendRequest.find(params[:id])
        @request.pending = false
        @request.save
        redirect_to friend_requests_path
    end

    private

    def friend_request_params
        params.require(:request).permit(:sender_id, :recipient_id)
    end
end
