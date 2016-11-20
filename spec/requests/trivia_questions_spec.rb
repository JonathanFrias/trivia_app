require 'rails_helper'

RSpec.describe "TriviaQuestions", type: :request do
  describe "GET /trivia_questions" do
    it "works! (now write some real specs)" do
      get trivia_questions_path
      expect(response).to have_http_status(200)
    end
  end
end
