json.array!(@pages) do |page|
  json.extract! page, :id, :name, :description, :photo
  json.url page_url(page, format: :json)
end
