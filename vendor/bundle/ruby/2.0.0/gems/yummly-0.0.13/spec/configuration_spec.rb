require "spec_helper"

describe Yummly::Configuration do
  subject { Yummly::Configuration.new }

  specify { subject.should respond_to(:app_key) }
  specify { subject.should respond_to(:app_id) }

  describe "http_adapter" do
    specify { subject.http_adapter.should == Yummly::FaradayAdapter }
    context "when set" do
      before { subject.http_adapter = String }
      specify {subject.http_adapter.should == String}
    end
  end

  describe "#use_ssl?" do
    specify { subject.use_ssl?.should be_false }

    context "when set" do
      before { subject.use_ssl = true }
      specify { subject.use_ssl?.should be_true }
    end
  end

end