require 'rails_helper'

RSpec.describe TriviaQuestion, type: :model do

  subject { described_class.new }

  let(:create_tags!) do
    subject.tag_list = "comic sans, is the best"
  end

  let(:create_taggings!) do
    create_tags!
    questions = FactoryGirl.create_list(:trivia_question, 2)

    comic_sans = Tag.find_by_name("comic sans").id
    best = Tag.find_by_name("is the best").id
    Tagging.create(tag_id: comic_sans, trivia_question_id: questions.first.id)
    Tagging.create(tag_id: comic_sans, trivia_question_id: questions.last.id)
    Tagging.create(tag_id: best, trivia_question_id: questions.first.id)
  end

  it "tag lists" do
    expect do
      create_tags!
    end.to change { Tag.count }.by(2)
  end

  it "counts tags" do
    create_taggings!
    results = TriviaQuestion.tag_counts
    expect(results.find { |it| it.name == 'is the best'}.count).to eq 1
    expect(results.find { |it| it.name == 'comic sans' }.count).to eq 2
  end
end
