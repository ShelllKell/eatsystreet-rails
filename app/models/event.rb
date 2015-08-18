class Event
  class << self

    def all_events(token, start, stop)
      client = api_client(token)
      service = client.discovered_api('calendar', 'v3')
      response = client.execute(
        api_method: service.events.list,
        parameters: {
          'calendarId'  => 'primary',
          'start.date'  => start.to_s,
          'end.date'    => stop.to_s
          }
      )

      response = JSON.parse(response.body)

      response["items"].collect { |event|
        Event.new(event)
      }.select { |event|
        !event.all_day?
      }
    end

    def create(token, params)
      event = {
        'summary' => params[:recipe].summary,
        'description' => params[:recipe].description,
        'start' => {
          'dateTime' => params[:start].gsub("+00:00", "+06:00"),
          'timeZone' => 'America/Denver',
        },
        'end' => {
          'dateTime' => params[:end].gsub("+00:00", "+06:00"),
          'timeZone' => 'America/Denver',
        }
      }

      client = api_client(token)
      service = client.discovered_api('calendar', 'v3')
      response = client.execute(
        api_method: service.events.insert,
        parameters: {
          'calendarId'  => 'primary'
        },
        body_object: event
      )
    end

    private

    def api_client(token)
      client = Google::APIClient.new
      client.authorization.access_token = token
      client
    end
  end

  def initialize(google_event_data)
    @google_event_data = google_event_data
  end

  def time
    @time ||= DateTime.parse(@google_event_data["start"]["dateTime"]).in_time_zone('Mountain Time (US & Canada)')
  end

  def end_time
    @end_time ||= DateTime.parse(@google_event_data["start"]["dateTime"]).in_time_zone('Mountain Time (US & Canada)')
  end

  def day
    time.day
  end

  def hour
    time.hour
  end

  def day_of_week
    time.strftime("%A")
  end

  def name
    @google_event_data["summary"]
  end

  def description
    @google_event_data["description"]
  end

  def all_day?
    !@google_event_data["start"]["dateTime"]
  end

  def today?
    time.to_s.split[0] == DateTime.now.in_time_zone('Mountain Time (US & Canada)').to_s.split[0]
  end

  def is_dinner_plan?
    name.start_with?('Dinner')
  end

end
