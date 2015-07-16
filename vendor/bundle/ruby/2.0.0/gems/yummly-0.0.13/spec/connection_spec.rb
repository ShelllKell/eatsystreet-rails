require "spec_helper"

describe Yummly::Connection do

  let(:app_id) { "123456" }
  let(:app_key) { "ABCDEFG123456" }

  before do
    Yummly.configure do |config|
      config.app_id = app_id
      config.app_key = app_key
      config.http_adapter = MockHttpAdapter
    end
  end

  describe "get" do
    it "parses a successful response" do
      response = Yummly::Connection.get("recipe/French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364")
      response.should be_a(Hash)
    end

    it "returns nil when a 404 is encountered" do
      response = Yummly::Connection.get("recipe/missing-recipe-1234")
      response.should be_nil
    end

    it "raises a permission exception when access is denied" do
      expect { Yummly::Connection.get("recipe/permission-denied") }.to raise_error(Yummly::PermissionError)
    end

    it "raises an exception when an internal error occurs" do
      expect { Yummly::Connection.get("recipe/internal-error") }.to raise_error(Yummly::InternalServerError)
    end
  end


end