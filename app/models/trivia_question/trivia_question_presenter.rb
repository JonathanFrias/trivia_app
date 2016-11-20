class TriviaQuestionPresenter < SimpleDelegator

  include ActionView::Helpers::UrlHelper

  def initialize(question)
    @question = question
    __setobj__(question)
  end

  def tags
    __getobj__.public_send(:tags).map(&:name).map do |t|
      link_to t, "/trivia_questions/tag/#{t}"
    end.join(', ')
  end
end
