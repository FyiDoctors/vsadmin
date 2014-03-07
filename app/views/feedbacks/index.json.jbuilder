json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :content, :feedback_type, :email
  json.url feedback_url(feedback, format: :json)
end
