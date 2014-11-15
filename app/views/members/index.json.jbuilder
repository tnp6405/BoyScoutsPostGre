json.array!(@members) do |member|
  json.extract! member, :id, :member_id, :member_last_name, :member_first_name, :member_cell, :member_landline, :member_email, :memberInactive, :member_vehicle
  json.url member_url(member, format: :json)
end
