require "spec_helper"

describe Yummly::Api do

  before do
    Yummly.configure do |config|
      config.app_id = "12345"
      config.app_key = "XEARSGSTH12345789"
      config.http_adapter = MockHttpAdapter
    end
  end

  subject { }

  describe "#find" do
    let(:result) { Yummly::Api.find('French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364') }

    specify { result.should be_a(Yummly::Recipe) }

    it "populates the recipe object with the json response" do
      result.json.should == read_json_file('get_recipe.json')
    end

    context "no recipe found" do
      let(:result) { Yummly::Api.find('missing-recipe-1234') }
      specify { result.should be_nil }
    end
  end

end

def read_json_file(name)
  path = File.expand_path("spec/fixtures/#{name}")
  JSON.parse(File.open(path, 'rb').read)
end