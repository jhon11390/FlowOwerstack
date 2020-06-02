class CommentsController < ApplicationController
    def create
        @commentable = Question.find(params[:question_id])
        @comment = @commentable.comments.new(comments_params)
        @comment.user = current_user
        @comment.save

        redirect_to @commentable, notice: "El comentario fue publicado con éxito"
    end

    def create_answer
        @commentable = Answer.find(params[:answer_id])
        @comment = @commentable.comments.new(comments_params)
        @comment.user = current_user
        @comment.save

        redirect_to @comment.commentable.question, notice: "El comentario fue publicado con éxito"
    end

    private
    def comments_params
        params.require(:comment).permit(:body)
    end
end
