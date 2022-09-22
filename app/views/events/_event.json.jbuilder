json.extract! event, :id, :title, :bar, :teaser, :day, :date, :secondtype, :start_time, :created_at, :updated_at
json.url event_url(event, format: :json)
