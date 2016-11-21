require 'rails_helper'
RSpec.describe ScoreAnswer do
  subject { described_class.new(answer).call }

  let(:question) do
    FactoryGirl.create(:trivia_question)
  end

  let(:user) do
    question.user
  end

  let(:answer) do
    FactoryGirl.create(:answer,
      answer: answer_text,
      trivia_question: question,
      user: user
    )
  end

  context "good answer" do
    let(:answer_text) do
      question.correct_answer
    end

    it "increments the users score" do
      subject
      expect(question.user.score).to eq 4
    end
  end

  context "bad answer" do

    let(:answer_text) do
      question.correct_answer*2
    end

    it "increments the users score" do
      subject
      expect(question.user.score).to eq(-1)
    end
  end

  context "answers the same question again" do
    it "does not change the score" do
      pending "Fix this bug"
      fail
    end
  end
end
