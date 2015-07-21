class CalendarsController < ApplicationController

  def index
    @user_preference = UserPreference.find_by(bowtie_user_id: current_bowtie_user_id)
    @token = request.headers['HTTP_X_BOWTIE_USER_GOOGLE_OAUTH2_TOKEN']
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      api_method: service.events.list,
      parameters: {'calendarId' => 'primary'}
    )

    response = JSON.parse(@result.body)
    @items = response["items"]
  end

end
