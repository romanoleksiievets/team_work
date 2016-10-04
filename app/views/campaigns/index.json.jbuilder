json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :type, :title, :text, :target, :when
  json.url campaign_url(campaign, format: :json)
end
