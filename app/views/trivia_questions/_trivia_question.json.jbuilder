json.extract! trivia_question, :id, :question, :user_id, :created_at, :updated_at
json.url trivia_question_url(trivia_question, format: :json)