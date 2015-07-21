class UserPreferencesController < ApplicationController

  def index

  end

  def new
    @user_preference = UserPreference.new
  end

  def create
    @user_preference = UserPreference.new(user_preferences_params.update({
      bowtie_user_id: current_bowtie_user_id
    }))

    if @user_preference.save
      redirect_to calendars_path
    else
      render :new
    end
  end

  private

  def user_preferences_params
    params.require(:user_preference).permit({cuisine_preference: []})
  end

end
