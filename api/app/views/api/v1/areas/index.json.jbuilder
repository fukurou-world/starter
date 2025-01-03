json.array! @areas do |area|
  json.extract! area, :id, :name, :created_at, :updated_at
end