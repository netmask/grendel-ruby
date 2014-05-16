require 'spec_helper'

describe "Grendel::Client" do
  before do
    @client = Grendel::Client.new("http://example.com")
  end

  describe "new method" do
    it "should set the base_uri" do
      @client.base_uri.should == "http://example.com"
    end
  end

  describe "users method" do
    it "should return a Grendel::UserManager" do
      @client.users.should be_a(Grendel::UserManager)
    end
  end
end
