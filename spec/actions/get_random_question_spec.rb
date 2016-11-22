RSpec.describe GetRandomQuestion do

  subject { described_class.new.call }

  let(:questions) { FactoryGirl.create_list(:trivia_question, 10) }

  let(:user) { FactoryGirl.create(:user) }

  let!(:rate_questions) do
    questions.each do |q|
      q.add_evaluation(:votes, rand(0..50), user)
    end
  end

  it "sorts the randomly selected questions by rating" do
  end
end
