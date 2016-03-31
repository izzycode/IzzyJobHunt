json.array!(@companies) do |company|
  json.extract! company, :id, :name, :address, :main_phone, :useful_links, :notes
  json.url company_url(company, format: :json)
end
