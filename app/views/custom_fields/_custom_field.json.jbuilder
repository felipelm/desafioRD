json.extract! custom_field, :id, :custom_field_type, :name, :description, :default, :created_at, :updated_at
json.url custom_field_url(custom_field, format: :json)
