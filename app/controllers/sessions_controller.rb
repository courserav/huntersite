class SessionsController < ApplicationController
    require 'securerandom'

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def create_by_facebook
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(10)
            u.currency = 50
          end
        
        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

    def destroy
        session.clear
        redirect_to posts_path 
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end