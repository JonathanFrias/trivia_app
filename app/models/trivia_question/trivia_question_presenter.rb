class TriviaQuestionPresenter < SimpleDelegator

  include ActionView::Helpers::UrlHelper

  def initialize(question, current_user)
    @current_user = current_user
    @question = question
    __setobj__(question)
  end

  def tag_links
    raw(tags.map(&:name).map do |t|
      link_to t, "/trivia_questions/tag/#{t}"
    end.join(', '))
  end

  def edit_link
    if self.user == current_user
      raw(link_to 'Edit Question', urls.edit_trivia_question_path(self))
    end
  end

  private
  attr_reader :current_user

  def urls
    Rails.application.routes.url_helpers
  end
end
