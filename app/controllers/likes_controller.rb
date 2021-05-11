class LikesController < ApplicationController
    def index
        @likes = Like.all
    end

    def show
        @like = Like.find(params[:id])
    end

    def new
        @like = Like.new
    end

    def create
        @comment = Comment.find(params[:comment_id])
        @post = @comment.post
        @like = @comment.likes.create(like_params)
        @like.update_attribute(:true_if_like, true)

        if @comment.likes.return_likes.count > 5 
            @post.user.update_attribute(:currency, (@post.user.currency + 10))
        end
        
        redirect_to @post
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
        params.permit(:true_if_like, :comment_id)
    end
end