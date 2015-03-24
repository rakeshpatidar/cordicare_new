json.array!(@photomsgs) do |photomsg|
  json.extract! photomsg, :photomsg_id, :physician, :image, :created_at
  json.url patient_url(photomsg, format: :json)
end
