class FriendRequestsController < ApplicationController

    def index
        @requests = FriendRequest.where(recipient_id: current_user.id, pending: true)
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
        # create friend association
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
