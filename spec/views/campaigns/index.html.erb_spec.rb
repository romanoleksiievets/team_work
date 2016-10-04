require 'rails_helper'

RSpec.describe "campaigns/index", type: :view do
  before(:each) do
    assign(:campaigns, [
      Campaign.create!(
        :type => 1,
        :title => "Title",
        :text => "MyText",
        :target => "Target",
        :when => "When"
      ),
      Campaign.create!(
        :type => 1,
        :title => "Title",
        :text => "MyText",
        :target => "Target",
        :when => "When"
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Target".to_s, :count => 2
    assert_select "tr>td", :text => "When".to_s, :count => 2
  end
end
