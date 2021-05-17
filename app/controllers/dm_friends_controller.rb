class DmFriendsController < ApplicationController
    def index
        @dm_friends = DmFriend.all
    end

    def create
        @user = User.find(params[:user_id])
        @dm_friend = DmFriend.new(:username => @user.username)

        if @dm_friend.valid?
            @dm_friend.save
        end
    end

    private
    
end