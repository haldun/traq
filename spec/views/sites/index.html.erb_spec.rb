require 'spec_helper'

describe "sites/index.html.erb" do
  before(:each) do
    assign(:sites, [
      stub_model(Site,
        :user => nil,
        :name => "Name",
        :url => "Url",
        :time_zone => "Time Zone",
        :token => "Token"
      ),
      stub_model(Site,
        :user => nil,
        :name => "Name",
        :url => "Url",
        :time_zone => "Time Zone",
        :token => "Token"
      )
    ])
  end

  it "renders a list of sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Time Zone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end
