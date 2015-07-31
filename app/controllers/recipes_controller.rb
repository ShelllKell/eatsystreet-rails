class RecipesController < ApplicationController

  def index
    @user_preference = UserPreference.find_by(bowtie_user_id: current_bowtie_user_id)
    @recipes = Recipe.search_recipes(@user_preference)
  end

end
