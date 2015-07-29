class RecipesController < ApplicationController

  def index
    # select the user preference where the BT user id = current BT user id
    # grab their cuisine preferences
    # query yummly for recipes' ["cuisine"] field
    # iterate through user cuisine preferences, and see if any match yummly's ["cuisine"] field


    @user_preference = UserPreference.find_by(bowtie_user_id: current_bowtie_user_id)
    @recipes = Recipe.search_recipes(@user_preference)

  end

end
