require "spec_helper"

describe Yummly::UrlBuilder do

  let(:ssl) { false }
  let(:app_id) { "123456" }
  let(:app_key) { "ABCDEFG123456" }

  before do
    Yummly.configure do |config|
      config.use_ssl = ssl
      config.app_id = app_id
      config.app_key = app_key
    end
  end

  describe ".domain" do
    context "when ssl is not enabled" do
      specify { Yummly::UrlBuilder.domain.should == "http://api.yummly.com" }
    end

    context "when ssl is enabled" do
      let(:ssl) { true }
      specify { Yummly::UrlBuilder.domain.should == "https://api.yummly.com" }
    end
  end

  describe ".protocol" do
    context "when ssl is not enabled" do
      specify { Yummly::UrlBuilder.protocol.should == "http" }
    end

    context "when ssl is enabled" do
      let(:ssl) { true }
      specify { Yummly::UrlBuilder.protocol.should == "https" }
    end
  end

  describe ".build_params_query_string" do
    let(:query_string) { Yummly::UrlBuilder.build_params_query_string(:name => 'test') }
    it "contains the app key" do
      query_string.should match /_app_key=#{app_key}/
    end
    it "contains the app id" do
      query_string.should match /_app_id=#{app_id}/
    end
    it "contains the name parameter" do
      query_string.should match /name=test/
    end
  end

  describe ".uri" do
    let(:uri) { Yummly::UrlBuilder.uri(:search, :name => 'test') }
    specify { uri.should == "/#{Yummly::API_VERSION}/api/search?name=test&_app_id=123456&_app_key=ABCDEFG123456"}
  end

end