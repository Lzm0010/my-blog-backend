class CommentsController < ApplicationController
    before_action :set_comment, only: [:update, :destroy]

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: {"error": "Something went wrong your comment did not post!"}
        end
    end

    def update
        if comment.update(comment_params)
            render json: comment
        else 
            render json: {"error": "Something went wrong your comment did not update!"}
        end
    end

    def destroy
        if comment.destroy
            render json: comment
        else
            render json: {"error": "Something went wrong your comment did not delete!"}
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:id, :content, :author, :user_id, :post_id)
    end

    def set_comment
        comment = Comment.find(params[:id])
    end
end
