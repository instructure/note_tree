json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :course_id, :date, :title, :summary
  json.url lecture_url(lecture, format: :json)
end
