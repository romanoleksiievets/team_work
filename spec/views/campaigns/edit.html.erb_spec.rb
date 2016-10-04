require 'rails_helper'

RSpec.describe "campaigns/edit", type: :view do
  before(:each) do
    @campaign = assign(:campaign, Campaign.create!(
      :type => 1,
      :title => "MyString",
      :text => "MyText",
      :target => "MyString",
      :when => "MyString"
    ))
  end

  it "renders the edit campaign form" do
    render

    assert_select "form[action=?][method=?]", campaign_path(@campaign), "post" do

      assert_select "input#campaign_type[name=?]", "campaign[type]"

      assert_select "input#campaign_title[name=?]", "campaign[title]"

      assert_select "textarea#campaign_text[name=?]", "campaign[text]"

      assert_select "input#campaign_target[name=?]", "campaign[target]"

      assert_select "input#campaign_when[name=?]", "campaign[when]"
    end
  end
end
