require 'rails_helper'
RSpec.describe GetRandomQuestions do

  subject { described_class.new.call }

  let(:questions) { FactoryGirl.create_list(:trivia_question, 10) }

  let(:user) { FactoryGirl.create(:user) }

  let(:sorted_questions) do
    questions.sort { |a, b|
      b.reputation_for(:votes).to_i <=> a.reputation_for(:votes).to_i
    }
  end

  let!(:rate_questions) do
    questions.each do |q|
      q.add_evaluation(:votes, rand(0..50), user)
    end
  end

  it "sorts the randomly selected questions by rating" do
    # The idea is that we get a bunch of random records,
    # but we also want highly rated questions to show up a bit more
    # often, we sort the random retrieved record by their ranking

    # Just realized I can't test that something random happens
  end
end
