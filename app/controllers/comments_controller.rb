class CommentsController < ApplicationController
    def create
        @commentable = Question.find(params[:question_id])
        @comment = @commentable.comments.new(comments_params)
        @comment.user = current_user
        @comment.save

        redirect_to @commentable
    end

    def create_answer
        @commentable = Answer.find(params[:answer_id])
        @comment = @commentable.comments.new(comments_params)
        @comment.user = current_user
        @comment.save

        redirect_to @comment.commentable.question
    end

    private
    def comments_params
        params.require(:comment).permit(:body)
    end
end
