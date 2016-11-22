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
        format.html { redirect_to answer.trivia_question, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: answer }
      else
        format.html do
          redirect_to new_answer_for_path(trivia_question_id) rescue render :new
        end
        format.json { render json: answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if answer.update(answer_params)
        format.html { redirect_to answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: answer }
      else
        format.html { render :edit }
        format.json { render json: answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
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
        flash.notice = "Answer was #{answer.correct_answer}"
        flash.notice = "Correct! Answer was #{answer.correct_answer}" if is_correct
      rescue ActiveRecord::RecordInvalid
        flash.alert = "You have already answered this question!"
      end
    end
end
