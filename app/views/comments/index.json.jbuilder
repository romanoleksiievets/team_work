json.array!(@comments) do |comment|
  json.extract! comment, :id, :project_id, :text
  json.url comment_url(comment, format: :json)
end
