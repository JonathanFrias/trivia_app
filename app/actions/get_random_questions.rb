class GetRandomQuestions

  def initialize(number=10)
    @limit = number
  end

  def call
    # TODO: This might be a performance problem
    # in the future
    questions = TriviaQuestion.order("RANDOM()").limit(limit)
    questions.sort { |a,b|
      b.reputation_for(:votes).to_i <=> a.reputation_for(:votes).to_i
    }
  end

  private
  attr_reader :limit
end
