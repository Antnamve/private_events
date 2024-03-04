json.extract! event, :id, :host, :location, :date, :details, :attendance, :created_at, :updated_at
json.url event_url(event, format: :json)
