json.array!(@recitals) do |recital|
  json.extract! recital, :id, :title, :content, :image_path
  json.url recital_url(recital, format: :json)
end
