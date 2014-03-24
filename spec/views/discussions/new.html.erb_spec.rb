require 'spec_helper'

describe "discussions/new" do
  before(:each) do
    assign(:discussion, stub_model(Discussion,
      :name => "MyString",
      :forum_id => 1
    ).as_new_record)
  end

  it "renders new discussion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", discussions_path, "post" do
      assert_select "input#discussion_name[name=?]", "discussion[name]"
      assert_select "input#discussion_forum_id[name=?]", "discussion[forum_id]"
    end
  end
end
