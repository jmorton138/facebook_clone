class StaticPagesController < ApplicationController
    def show
        @requests = FriendRequest.where(recipient_id: current_user.id, pending: true)

        render template: "static_pages/#{params[:page]}"
    end
end
