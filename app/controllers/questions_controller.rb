class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @questions = Question.all

    if params[:title].present?
      @questions = @questions.where("title ILIKE ?", "%#{params[:title]}%")
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
        redirect_to :questions, notice: "La pregunta fue publicada con éxito"
    else
        render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
