class CalendarsController < ApplicationController

  def index
    @events = Event.all_events(request.headers['HTTP_X_BOWTIE_USER_GOOGLE_OAUTH2_TOKEN'])
  end

  def week
    @calendar = Calendar.new(request.headers['HTTP_X_BOWTIE_USER_GOOGLE_OAUTH2_TOKEN'])
  end

  def day
    @calendar = Calendar.new(request.headers['HTTP_X_BOWTIE_USER_GOOGLE_OAUTH2_TOKEN'])
  end

end
