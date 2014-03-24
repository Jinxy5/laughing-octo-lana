require 'spec_helper'

describe "discussions/edit" do
  before(:each) do
    @discussion = assign(:discussion, stub_model(Discussion,
      :name => "MyString",
      :forum_id => 1
    ))
  end

  it "renders the edit discussion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", discussion_path(@discussion), "post" do
      assert_select "input#discussion_name[name=?]", "discussion[name]"
      assert_select "input#discussion_forum_id[name=?]", "discussion[forum_id]"
    end
  end
end
