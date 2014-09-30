json.array!(@sessions) do |session|
  json.extract! session, :id, :topic, :start_date, :start_time, :end_time, :location, :description, :speaker, :status, :events_id
  json.url session_url(session, format: :json)
end
