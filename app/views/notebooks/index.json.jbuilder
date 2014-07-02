json.array!(@notebooks) do |notebook|
  json.extract! notebook, :id, :text, :date, :title
  json.url notebook_url(notebook, format: :json)
end
