class Calendar
  TIME_ZONE = 'Mountain Time (US & Canada)'

  Calendar::TIME_ZONE

  def initialize(token)
    @token = token
  end

  def events
    @events ||= Event.all_events(@token, start, stop)
  end

  def days
    (stop - start + 1).to_i.times.collect { |days_since_start|
      day_date = start + days_since_start
      events_for_day = events.select { |event|
        event.time.in_time_zone(TIME_ZONE).to_date == day_date
      }

      Day.new(day_date, events_for_day)

    }
  end

  def start
    _start = today
  end

  def stop
    _stop = today.beginning_of_week + 4
  end

  def today
    now.in_time_zone(TIME_ZONE).to_date
  end

  def now
    DateTime.now
  end

  def create_event(params)
    Event.create(@token, params)
  end

  class Day

    def initialize(date, events)
      @date = date
      @events = events
    end

    def hours
      [17, 18, 19, 20, 21].collect { |hour_of_day|
        hour_time = @date.to_time + hour_of_day.hours
        events_for_hour = @events.select { |event|

          hour_start_time = hour_time.in_time_zone(TIME_ZONE).to_time
          hour_end_time = hour_time + 1.hour
          # binding.pry

          (event.time...event.end_time).overlaps?(hour_start_time...hour_end_time) #we want this to be false

        }
        Hour.new(hour_time, events_for_hour)
      }
    end

    def name
      @date.strftime("%A")
    end

    def today?
      @date == DateTime.now.in_time_zone(TIME_ZONE).to_date
    end

    def date
      @date
    end

    def todays_time_in_zone
      DateTime.now.in_time_zone(TIME_ZONE).to_date
    end

    def events
      @events
    end

    def has_dinner_plan?
      @events.any? { |event|
        event.is_dinner_plan?
      }
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

    def hour
      @time.hour
    end

    def name
      @time.strftime("%l %P")
    end

    def start_rfc3339
      DateTime.parse(@time.to_s).in_time_zone(TIME_ZONE).rfc3339
    end

    def end_rfc3339
      DateTime.parse((@time + 1.hour).to_s).in_time_zone(TIME_ZONE).rfc3339
    end

  end

end
