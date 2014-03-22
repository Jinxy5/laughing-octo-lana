require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :user_name => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :nick_name => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_user_name[name=?]", "user[user_name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_password_digest[name=?]", "user[password_digest]"
      assert_select "input#user_nick_name[name=?]", "user[nick_name]"
    end
  end
end
