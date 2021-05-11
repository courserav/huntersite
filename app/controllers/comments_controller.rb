class CommentsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]

    def index
        @comments = Comment.all
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def new
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.user_id = current_user.id

        if @comment.valid?
            @comment.save
            redirect_to @post
        else
            render :new
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
    
            if @comment.valid?
                @comment.save
                redirect_to comment_path(@comment)
            else
                render :edit
            end
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to post_path(current_user)
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :author, :post_id, :user_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end