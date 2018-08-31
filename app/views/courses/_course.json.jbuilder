json.extract! course, :id, :name, :speaker, :vacancies, :duration, :created_at, :updated_at
json.url course_url(course, format: :json)
