class CommentsController < ApplicationController
    def create
        @commentable = Question.find(params[:question_id])
        @comment = @commentable.comments.new(comments_params)
        @comment.user = current_user
        @comment.save

        redirect_to @commentable

        unless @comment.save
            flash[:alert] = "El comentario no puede estar vacio"
        end
    end

    def create_answer
        @commentable = Answer.find(params[:answer_id])
        @comment = @commentable.comments.new(comments_params)
        @comment.user = current_user
        @comment.save

        redirect_to @comment.commentable.question

        unless @comment.save
            flash[:alert] = "El comentario no puede estar vacio"
        end
    end

    private
    def comments_params
        params.require(:comment).permit(:body)
    end
end
