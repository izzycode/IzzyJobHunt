json.array!(@honchos) do |honcho|
  json.extract! honcho, :id, :name, :position, :phone_number, :email, :notes, :links
  json.url honcho_url(honcho, format: :json)
end
