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

  def event
    @recipe = Recipe.find_recipe(params[:recipe_id])
    @calendar = Calendar.new(request.headers['HTTP_X_BOWTIE_USER_GOOGLE_OAUTH2_TOKEN'])
    @calendar.create_event(start: params[:start], end: params[:end], recipe: @recipe)

    if Calendar.new(request.headers['X-Bowtie-User-Plan']) == 'eatsystreet'
      redirect_to week_calendar_path
    else
      redirect_to day_calendar_path
    end
  end

end
