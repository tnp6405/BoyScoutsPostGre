json.array!(@activities) do |activity|
  json.extract! activity, :id, :activity_id, :member_id, :activity_date, :activity_ampm, :activity_type, :activity_unit_count
  json.url activity_url(activity, format: :json)
end
