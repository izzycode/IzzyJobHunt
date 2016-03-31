json.array!(@attempts) do |attempt|
  json.extract! attempt, :id, :date, :medium, :summary
  json.url attempt_url(attempt, format: :json)
end
