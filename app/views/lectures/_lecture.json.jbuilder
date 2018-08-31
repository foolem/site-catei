json.extract! lecture, :id, :name, :duration, :speaker, :created_at, :updated_at
json.url lecture_url(lecture, format: :json)
