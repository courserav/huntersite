class DirectMessagesController < ApplicationController
    
    def index
        @dm_friend = DmFriend.find(params[:dm_friend_id])
        @direct_messages = DirectMessage.where(params[:dm_friend_id])
    end

    def new
        @direct_message = DirectMessage.new(params[:id])
    end

    def create
        @direct_message = DirectMessage.new(message_params)

            if @direct_message.valid?
                @direct_message.save
                redirect_to dm_friend_direct_messages_path(@direct_message.dm_friend_id, @direct_message)
            else
                redirect_to new
            end
    end

    private

    def message_params
        params.require(:direct_message).permit(:content, :user_id, :dm_friend_id)
    end
end