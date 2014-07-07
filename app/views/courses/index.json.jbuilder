json.array!(@courses) do |course|
  json.extract! course, :id, :short_name, :name, :description, :start_date, :end_date
  json.url course_url(course, format: :json)
end
