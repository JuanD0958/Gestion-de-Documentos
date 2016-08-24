json.array!(@assistences) do |assistence|
  json.extract! assistence, :id
  json.url assistence_url(assistence, format: :json)
end
