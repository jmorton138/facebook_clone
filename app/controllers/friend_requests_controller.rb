class FriendRequestsController < ApplicationController

    def index
        # @requests = FriendRequest.where(recipient: current_user)
    end

    def create
        @friend_request = FriendRequest.new(sender_id: current_user.id, recipient_id: params[:recipient_id])

        if @friend_request.save
            redirect_to root_path
        end

    end

    private

    def friend_request_params
        params.require(:request).permit(:sender_id, :recipient_id)
    end
end
