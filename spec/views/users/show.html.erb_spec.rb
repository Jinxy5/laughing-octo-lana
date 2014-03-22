require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :user_name => "User Name",
      :email => "Email",
      :password_digest => "Password Digest",
      :nick_name => "Nick Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Name/)
    rendered.should match(/Email/)
    rendered.should match(/Password Digest/)
    rendered.should match(/Nick Name/)
  end
end
