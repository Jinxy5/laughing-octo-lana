require 'spec_helper'

describe "forums/new" do
  before(:each) do
    assign(:forum, stub_model(Forum,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new forum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", forums_path, "post" do
      assert_select "input#forum_name[name=?]", "forum[name]"
    end
  end
end
