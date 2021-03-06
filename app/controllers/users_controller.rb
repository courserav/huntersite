class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        @user.currency = 50

        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        
            if @user.valid?
                @user.save
                redirect_to user_path(@user)
            else
                render :edit
            end
    end

    def destroy

    end

    def alpha
        @users = User.sort_by_currency
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :uid)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end