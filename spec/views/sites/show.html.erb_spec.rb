require 'spec_helper'

describe "sites/show.html.erb" do
  before(:each) do
    site = assign(:site, stub_model(Site,
      :user => nil,
      :name => "Name",
      :url => "Url",
      :time_zone => "Time Zone",
      :token => "Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Time Zone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Token/)
  end
end
