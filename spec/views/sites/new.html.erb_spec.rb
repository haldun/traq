require 'spec_helper'

describe "sites/new.html.erb" do
  before(:each) do
    assign(:site, stub_model(Site,
      :user => nil,
      :name => "MyString",
      :url => "MyString",
      :time_zone => "MyString",
      :token => "MyString"
    ).as_new_record)
  end

  it "renders new site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sites_path, :method => "post" do
      assert_select "input#site_user", :name => "site[user]"
      assert_select "input#site_name", :name => "site[name]"
      assert_select "input#site_url", :name => "site[url]"
      assert_select "input#site_time_zone", :name => "site[time_zone]"
      assert_select "input#site_token", :name => "site[token]"
    end
  end
end
