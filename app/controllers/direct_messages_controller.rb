class DirectMessagesController < ApplicationController
    
    def index
        @direct_messages = DirectMessage.all
    end

    def new
        @direct_message = DirectMessage.find(params[:id])
    end

    def create
        @direct_message = DirectMessage.new(message_params)

            if @direct_message.valid?
                @direct_message.save
                redirect_to :chat
            else
                redirect_to "users/:id/show"
            end
    end

    private

    def message_params
        params.require(:direct_message).permit(:content, :user_id, :dm_friend_id)
    end
end