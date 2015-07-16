class RecipeFetcher

  def search_recipe(search_params)
    search_result = Yummly.search(search_params).first

    result = []

    result << search_result.recipe_name
    result << search_result.rating
    result << search_result.ingredients
    result << search_result.total_time_in_seconds / 60

    result
  end

  def find_recipe
    recipe = Yummly.find('French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364')
    recipe.images.first.small_url
  end

end
