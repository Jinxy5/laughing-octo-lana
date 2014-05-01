json.array!(@events) do |event|
  json.extract! event, :id, :startdate, :enddate, :title, :content, :image_path
  json.url event_url(event, format: :json)
end
