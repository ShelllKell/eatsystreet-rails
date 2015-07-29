class Calendar

  def initialize(token)
    @token = token
    @events = Event.all_events(token, start, stop)
  end

  def days
    5.times.collect { |days_since_start|
      day_date = start + days_since_start
      events_for_day = @events.select { |event| event.time.to_date == day_date }
      Day.new(day_date, events_for_day)
    }
  end

  def start
    _start = Date.today.beginning_of_week
  end

  def stop
    _stop = start + 5
  end

  class Day

    def initialize(date, events)
      @date = date
      @events = events
    end

    def hours
      [17, 18, 19, 20, 21].collect { |hour_of_day|
        hour_time = @date.to_time + hour_of_day.hours
        events_for_hour = @events.select { |event| hour_time <= event.time && hour_time + 1.hour > event.time }
        Hour.new(hour_time, events_for_hour)
      }
    end

    def name
      @date.strftime("%A")
    end

    def today?
      @date == Date.today
    end

    def date
      @date.to_time
    end
  end

  class Hour

    def initialize(time, events)
      @time = time
      @events = events
    end

    def events
      @events
    end

    def name
      @time.strftime("%l %P")
    end
  end

end
