class MockHttpAdapter

  def self.connection(url = nil)
    Faraday.new(:url => url) do |faraday|
      faraday.adapter :test, self.stubs
    end
  end

  def self.stubs
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get(uri('recipe/French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364')) {[ 200, {}, response("get_recipe.json") ]}
      stub.get(uri('recipe/missing-recipe-1234')) {[ 404, {}, nil ]}
      stub.get(uri('recipe/permission-denied')) {[ 409, {}, "Permission denied. Please check your app id and app key and try again later." ]}
      stub.get(uri('recipe/internal-error')) {[ 500, {}, "BOOM!" ]}
    end
  end

  def self.uri(path_fragment)
    "/#{Yummly::API_VERSION}/api/#{path_fragment}?_app_id=#{Yummly.configuration.app_id}&_app_key=#{Yummly.configuration.app_key}"
  end

  def self.response(name)
    path = File.expand_path("spec/fixtures/#{name}")
    File.open(path, 'rb').read
  end

end