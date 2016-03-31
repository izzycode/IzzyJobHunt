json.array!(@jobs) do |job|
  json.extract! job, :id, :position, :web_address
  json.url job_url(job, format: :json)
end
