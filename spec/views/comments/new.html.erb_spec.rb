require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :project_id => 1,
      :text => "MyText"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_project_id[name=?]", "comment[project_id]"

      assert_select "textarea#comment_text[name=?]", "comment[text]"
    end
  end
end
