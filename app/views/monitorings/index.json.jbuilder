json.array!(@monitorings) do |monitoring|
  json.extract! monitoring, :id
  json.url monitoring_url(monitoring, format: :json)
end
