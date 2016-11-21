require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TriviaQuestionsController, type: :controller do

  before do
    session[:user_id] = user_id
  end

  let(:user_id) { FactoryGirl.create(:user).id }

  # This should return the minimal set of attributes required to create a valid
  # TriviaQuestion. As you add validations to TriviaQuestion, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      question: "What is your favoriate animal?",
      correct_answer: "Dog",
      user_id: user_id,
      tag_list: "foo, bar"
    }
  }

  let(:invalid_attributes) {
    [
      # Question must be present
      {
        question: "",
        user_id: user_id,
      },
    ]
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TriviaQuestionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all trivia_questions as @trivia_questions" do
      trivia_question = TriviaQuestion.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:trivia_questions)).to eq([trivia_question])
    end

    it "filters trivia questions based on the provided tag" do
      TriviaQuestion.create! valid_attributes
      trivia_question = TriviaQuestion.create! valid_attributes
      tag = Tag.create(name: "foobar")
      Tagging.create(tag_id: tag.id, trivia_question_id: trivia_question.id)
      get :index, params: { tag: tag.name }

      expect(assigns(:trivia_questions).count).to eq(1)
    end
  end

  describe "GET #show" do
    it "assigns the requested trivia_question as @trivia_question" do
      trivia_question = TriviaQuestion.create! valid_attributes
      get :show, params: {id: trivia_question.to_param}, session: valid_session
      expect(assigns(:trivia_question)).to eq(trivia_question)
    end
  end

  describe "GET #new" do
    it "assigns a new trivia_question as @trivia_question" do
      get :new, params: {}, session: valid_session
      expect(assigns(:trivia_question)).to be_a_new(TriviaQuestion)
    end
  end

  describe "GET #edit" do
    it "assigns the requested trivia_question as @trivia_question" do
      trivia_question = TriviaQuestion.create! valid_attributes
      get :edit, params: {id: trivia_question.to_param}, session: valid_session
      expect(assigns(:trivia_question)).to eq(trivia_question)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new TriviaQuestion" do
        expect {
          post :create, params: {trivia_question: valid_attributes}, session: valid_session
        }.to change(TriviaQuestion, :count).by(1)
        expect(Tag.count).to eq 2
      end

      it "assigns a newly created trivia_question as @trivia_question" do
        post :create, params: {trivia_question: valid_attributes}, session: valid_session
        expect(assigns(:trivia_question)).to be_a(TriviaQuestion)
        expect(assigns(:trivia_question)).to be_persisted
      end

      it "redirects to the created trivia_question" do
        post :create, params: {trivia_question: valid_attributes}, session: valid_session
        expect(response).to redirect_to(TriviaQuestion.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved trivia_question as @trivia_question" do
        invalid_attributes.each do |attr|
          post :create, params: {trivia_question: attr}, session: valid_session
          expect(assigns(:trivia_question)).to be_a_new(TriviaQuestion)
        end
      end

      it "re-renders the 'new' template" do
        invalid_attributes.each do |attr|
          post :create, params: {trivia_question: attr}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          question: new_question,
          correct_answer: new_answer,
          tag_list: "stuff and things"
        }
      }

      let(:new_question) { "whats your fav color?" }
      let(:new_answer) { "blue" }

      it "updates the requested trivia_question" do
        trivia_question = TriviaQuestion.create! valid_attributes
        put :update, params: {id: trivia_question.to_param, trivia_question: new_attributes}, session: valid_session
        trivia_question.reload

        expect(trivia_question.question).to eq new_question
        expect(trivia_question.tags.map(&:name)).to eq ["stuff and things"]
        expect(trivia_question.correct_answer).to eq new_answer
      end

      it "assigns the requested trivia_question as @trivia_question" do
        trivia_question = TriviaQuestion.create! valid_attributes
        put :update, params: {id: trivia_question.to_param, trivia_question: valid_attributes}, session: valid_session
        expect(assigns(:trivia_question)).to eq(trivia_question)
      end

      it "redirects to the trivia_question" do
        trivia_question = TriviaQuestion.create! valid_attributes
        put :update, params: {id: trivia_question.to_param, trivia_question: valid_attributes}, session: valid_session
        expect(response).to redirect_to(trivia_question)
      end
    end

    context "with invalid params" do
      it "assigns the trivia_question as @trivia_question" do
        trivia_question = TriviaQuestion.create! valid_attributes
        invalid_attributes.each do |attr|
          put :update, params: {id: trivia_question.to_param, trivia_question: attr}, session: valid_session
          expect(assigns(:trivia_question)).to eq(trivia_question)
        end
      end

      it "re-renders the 'edit' template" do
        trivia_question = TriviaQuestion.create! valid_attributes
        invalid_attributes.each do |attr|
          put :update, params: {id: trivia_question.to_param, trivia_question: attr}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested trivia_question" do
      trivia_question = TriviaQuestion.create! valid_attributes
      expect {
        delete :destroy, params: {id: trivia_question.to_param}, session: valid_session
      }.to change(TriviaQuestion, :count).by(-1)
    end

    it "redirects to the trivia_questions list" do
      trivia_question = TriviaQuestion.create! valid_attributes
      delete :destroy, params: {id: trivia_question.to_param}, session: valid_session
      expect(response).to redirect_to(trivia_questions_url)
    end
  end
end
