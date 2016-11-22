class ScoreAnswer

  def initialize(answer, matcher=DefaultMatcher.new)
    @answer = answer
    @matcher = matcher
    @user = answer.user
  end

  def call
    answer_text = answer.answer
    correct_answer_text = answer.trivia_question.correct_answer
    is_correct = matcher.matches?(answer_text, correct_answer_text)
    if is_correct
      user.add_evaluation(:trivia_score, 4, answer.trivia_question)

      correct_streak!(user)
    else
      user.add_evaluation(:trivia_score, -1, answer.trivia_question)

      incorrect_streak!(user)
    end
    return is_correct
  end

  private
  attr_reader :answer, :matcher, :user

  def correct_streak!(user)
    user.increment(:current_correct_streak, 1)
    user.current_incorrect_streak = 0
    user.longest_correct_streak = [
      user.current_correct_streak,
      user.longest_correct_streak
    ].max
    user.save
  end

  def incorrect_streak!(user)
    user.increment(:current_incorrect_streak, 1)
    user.current_correct_streak = 0
    user.longest_incorrect_streak = [
      user.current_incorrect_streak,
      user.longest_incorrect_streak
    ].max
    user.save
  end

  class DefaultMatcher

    def matches?(answer1, answer2)
      answer1.downcase == answer2.downcase
    end
  end
end
