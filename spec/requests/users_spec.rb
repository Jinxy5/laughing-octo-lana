require 'spec_helper'

describe "User pages" do

  subject { page }

  describe 'sign up page' do
  	before { visit sign_up_path}

  	it_should_behave_like 'sign up page'
  end

  describe 'user show page' do
  	let(:user){ FactoryGirl.create(:user) }
  	
  	before { visit user_show_page(user) }
  end


end
