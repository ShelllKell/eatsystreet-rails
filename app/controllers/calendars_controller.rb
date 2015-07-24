class CalendarsController < ApplicationController

  def index
    @events = Event.all_events(request.headers['HTTP_X_BOWTIE_USER_GOOGLE_OAUTH2_TOKEN'])
  end

end
