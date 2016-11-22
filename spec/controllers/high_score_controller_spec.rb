require 'rails_helper'

RSpec.describe HighScoreController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "avg score for questions" do
    let(:questions) do
      FactoryGirl.create_list(:trivia_question, 6)
    end

    let(:user) { FactoryGirl.create(:user) }

    let!(:good_ratings) do
      questions[0..3].each do |q|
        user.add_evaluation(:trivia_score, 4, q)
      end
    end

    let!(:bad_ratings) do
      questions[4..5].each do |q|
        user.add_evaluation(:trivia_score, -1, q)
      end
    end

    it "computes the average correctly" do
      get :index
      expect(assigns[:avg_score]).to be_within(0.1).of(14)
    end


  end
  context "sorts by highest score" do

    let(:users) { FactoryGirl.create_list(:user, 5) }

    let!(:set_answers) do
      (1..users.count).each do |i|
        questions = FactoryGirl.create_list(:trivia_question, i)
        questions.each do |trivia|
          users[i-1].add_evaluation(:trivia_score, 4, trivia)
        end
      end
    end

    it "sorts the highest scores" do
      get :index

      expect(assigns[:high_scores]).not_to be nil
      expect(assigns[:high_scores].map(&:score)).to eq(assigns[:high_scores].map(&:score).sort.reverse)
      expect(assigns[:high_scores].map(&:score).uniq.count).to eq 5
    end
  end
end
