class PostsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]
    
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @user = User.find(params[:user_id])
        @post = Post.new
    end

    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.new(post_params)
        current_user.update_attribute(:currency, (current_user.currency - 1))

        if @post.valid?
            @post.save
            redirect_to user_post_path(@user, @post)
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        
            if @post.valid?
                @post.save
                redirect_to post_path(@post)
            else
                render :edit
            end
    end

    def destroy
        Post.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end

    private

    def post_params
        params.require(:post).permit(:text, :user_id, :image)
    end

    def require_login
        unless session.include?(:user_id)
            flash[:error] = "You must be logged in to mess with treasure."
            redirect_to :login
            #return head(:forbidden) - makes page blank.
        end 
    end
end