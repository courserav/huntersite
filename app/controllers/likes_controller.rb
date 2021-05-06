class LikesController < ApplicationController
    def index
        @likes = Like.all
    end

    def show
        @like = Like.find(params[:id])
    end

    def new
        @post = Post.find(params[:post_id])
        @like = Like.new
    end

    def create
        @post = Post.find(params[:post_id])
        @like = @post.comments.likes.new(like_params)

        if @like.valid?
            @like.save
            redirect_to @post
        else
            render :new
        end
    end

    def edit
        @like = Like.find(params[:id])
    end

    def update
        @like = Like.find(params[:id])
        @like.update(like_params)
    
            if @like.valid?
                @like.save
                redirect_to comment_path(@like)
            else
                render :edit
            end
    end

    def destroy
        Like.find(params[:id]).destroy
        redirect_to post_path(current_user)
    end

    private

    def like_params
        params.require(:like).permit(:true_if_like, :comment_id)
    end
end