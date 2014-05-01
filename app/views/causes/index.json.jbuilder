json.array!(@causes) do |cause|
  json.extract! cause, :id, :title, :content, :image_path, :amount_requested, :amount_donated
  json.url cause_url(cause, format: :json)
end
