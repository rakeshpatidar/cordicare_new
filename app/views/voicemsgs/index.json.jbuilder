json.array!(@voicemsgs) do |voicemsg|
  json.extract! voicemsg, :id, :physician, :patient_id, :voice
  json.url voicemsg_url(voicemsg, format: :json)
end
