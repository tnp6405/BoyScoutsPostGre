json.array!(@runs) do |run|
  json.extract! run, :id, :run_id, :route_id, :member_id, :run_date, :time_taken, :am_pm, :notes
  json.url run_url(run, format: :json)
end
