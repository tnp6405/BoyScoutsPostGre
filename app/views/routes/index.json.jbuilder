json.array!(@routes) do |route|
  json.extract! route, :id, :route_id, :routeName, :printSequence
  json.url route_url(route, format: :json)
end
