json.extract! registration, :id, :name, :grr, :cpf, :created_at, :updated_at
json.url registration_url(registration, format: :json)
