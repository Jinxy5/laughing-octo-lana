json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :name, :forum_id
  json.url discussion_url(discussion, format: :json)
end
