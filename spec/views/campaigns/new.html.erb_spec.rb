require 'rails_helper'

RSpec.describe "campaigns/new", type: :view do
  before(:each) do
    assign(:campaign, Campaign.new(
      :type => 1,
      :title => "MyString",
      :text => "MyText",
      :target => "MyString",
      :when => "MyString"
    ))
  end

  it "renders new campaign form" do
    render

    assert_select "form[action=?][method=?]", campaigns_path, "post" do

      assert_select "input#campaign_type[name=?]", "campaign[type]"

      assert_select "input#campaign_title[name=?]", "campaign[title]"

      assert_select "textarea#campaign_text[name=?]", "campaign[text]"

      assert_select "input#campaign_target[name=?]", "campaign[target]"

      assert_select "input#campaign_when[name=?]", "campaign[when]"
    end
  end
end
