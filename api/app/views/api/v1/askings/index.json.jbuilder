json.array! @askings do |asking|
  json.extract! asking, :id, :client_id, :history, :sent_at
end