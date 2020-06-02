class AnswersController < ApplicationController
    def create
        question = Question.find(params[:question_id])
        question.answers.create(answers_params)

        redirect_to question

        unless question.save
            flash[:alert] = "La respuesta no puede estar vacia"
        end
    end

    private

        def answers_params
            params.require(:answer).permit(:body).merge(user: current_user)
        end
end
