class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question



  def uplike
    @answer = Answer.find(params[:id])
    if @answer.user == current_user
      redirect_to question_path(@question), notice: "You can't like your answer"
    elsif current_user.voted_for? @answer
      redirect_to question_path(@question), notice: "You already like it"
    else
      @answer.liked_by current_user
      @answer.vote_registered?
      @answer.user.points += 5
      @answer.user.save
      redirect_to question_path(@question)
    end
  end
  def accept
    @answer = Answer.find(params[:answer_id])
    @answer.update(accept: true)
    @answer.user.update(points: @answer.user.points + 25)
    redirect_to question_path(@question), notice: "Answer was successfully approved."
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question), notice: "Answer was successfully created."
    else
      redirect_to question_path(@question), alert: "There was an error when adding answer."
    end
  end

  private

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:contents)
    end

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end
end
