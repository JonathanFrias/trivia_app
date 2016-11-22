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
      expect(user.reputation_for(:trivia_score).to_i).to eq(4)
    end
  end

  context "bad answer" do

    let(:answer_text) do
      question.correct_answer*2
    end

    it "increments the users score" do
      subject
      expect(user.reputation_for(:trivia_score).to_i).to eq(-1)
    end
  end

  context "streaking" do
    let(:questions) do
      FactoryGirl.create_list(:trivia_question, 6, correct_answer: answer_text)
    end

    let(:answer_text) { "foobar" }

    let(:user) do
      FactoryGirl.create(:user)
    end

    let(:correct_answers) do
      questions.map do |q|
        FactoryGirl.create(:answer, answer: answer_text, trivia_question: q, user: user)
      end
    end

    let(:incorrect_answers) do
      questions.map do |q|
        FactoryGirl.create(:answer, answer: "WRONG ANSWER!", trivia_question: q, user: user)
      end
    end

    it "should keep track of longest correct streak" do
      correct_answers[0..2].each do |answer|
        ScoreAnswer.new(answer).call
      end
      ScoreAnswer.new(incorrect_answers.last).call
      expect(user.longest_correct_streak).to eq 3
      expect(user.longest_incorrect_streak).to eq 1
    end

    it "should keep track of longest incorrect streak" do
      incorrect_answers[0..2].each do |answer|
        ScoreAnswer.new(answer).call
      end
      ScoreAnswer.new(correct_answers.last).call
      expect(user.longest_incorrect_streak).to eq 3
      expect(user.longest_correct_streak).to eq 1
    end
  end
end
