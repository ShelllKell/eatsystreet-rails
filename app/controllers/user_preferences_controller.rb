class UserPreferencesController < ApplicationController

  def index

  end

  def new
    @user_preference = UserPreference.new
  end

  def create
    @user_preference = UserPreference.find_or_initialize_by(bowtie_user_id: current_bowtie_user_id)

    if @user_preference.update_attributes(user_preferences_params)
      redirect_to week_calendar_path
    else
      render :new
    end
  end

  private

  def user_preferences_params
    params.require(:user_preference).permit({cuisine_preference: []})
  end

end
