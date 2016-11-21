class TriviaQuestionsController < ApplicationController
  before_action :set_trivia_question, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:create, :edit, :update]

  def index

    if params[:tag]
      trivia_questions = TriviaQuestion.tagged_with(params[:tag])
    else
      trivia_questions = TriviaQuestion.all
    end

    @trivia_questions = trivia_questions.map do |it|
      TriviaQuestionPresenter.new(it, current_user)
    end
  end

  def show
  end

  def new
    @trivia_question = TriviaQuestion.new
  end

  def edit
  end

  def create
    @trivia_question = TriviaQuestion.new(trivia_question_params)

    respond_to do |format|
      if @trivia_question.save
        format.html { redirect_to new_trivia_question_path, notice: 'Trivia question was successfully created.' }
        format.json { render :show, status: :created, location: @trivia_question }
      else
        format.html { render :new }
        format.json { render json: @trivia_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @trivia_question.update(trivia_question_params)
        format.html { redirect_to @trivia_question, notice: 'Trivia question was successfully updated.' }
        format.json { render :show, status: :ok, location: @trivia_question }
      else
        format.html { render :edit }
        format.json { render json: @trivia_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trivia_question.destroy
    respond_to do |format|
      format.html { redirect_to trivia_questions_url, notice: 'Trivia question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_trivia_question
      @trivia_question = TriviaQuestion.find(params[:id])
      @trivia_presenter = TriviaQuestionPresenter.new(trivia_question, current_user)
    end

    def trivia_question_params
      params
        .require(:trivia_question)
        .permit(:question, :tag_list, :correct_answer)
        .merge(user_id: current_user.id)
    end

    def trivia_question
      @trivia_question
    end
end
