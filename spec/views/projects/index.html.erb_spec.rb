require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :title => "Title",
        :text => "MyText",
        :city => "City"
      ),
      Project.create!(
        :title => "Title",
        :text => "MyText",
        :city => "City"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
  end
end
