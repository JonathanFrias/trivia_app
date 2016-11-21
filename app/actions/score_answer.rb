class ScoreAnswer

  def initialize(answer, matcher=DefaultMatcher.new)
    @answer = answer
    @matcher = matcher
    @user = answer.user
  end

  def call
    answer_text = answer.answer
    correct_answer_text = answer.trivia_question.correct_answer
    if matcher.matches?(answer_text, correct_answer_text)
      user.increment!(:score, 4)
    else
      user.increment!(:score, -1)
    end
  end

  private
  attr_reader :answer, :matcher, :user

  class DefaultMatcher

    def matches?(answer1, answer2)
      answer1 == answer2
    end
  end
end
