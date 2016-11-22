class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @answers = Answer.all
  end

  def show
  end

  def new
    @question_id = params[:question_id]
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if answer.save
        score_answer!
        format.json { render :show, status: :created, location: answer }
        format.html { redirect_to answer.trivia_question || '/' }
      else
        format.html { render :new }
        format.json { render json: answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    attr_reader :answer

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params
        .require(:answer)
        .permit(:answer, :trivia_question_id)
        .merge(user_id: current_user.id)
    end

    def trivia_question_id
      answer_params[:trivia_question_id]
    end

    def score_answer!
      begin
        is_correct = ScoreAnswer.new(answer).call
        flash.notice = "Answer is #{answer.trivia_question.correct_answer}, Your answer: #{answer.answer}"
        flash.notice = "Correct! Answer was #{answer.correct_answer}" if is_correct
      rescue ActiveRecord::RecordInvalid
        flash.alert = "You have already answered this question!"
      end
    end
end
