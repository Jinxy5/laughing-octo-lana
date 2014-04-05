require 'spec_helper'

describe 'user spec', js: true do
	Capybara.javascript_driver = :selenium


	let(:user_1){FactoryGirl.build(:user)}

	
	before do 
			
		ap user_1

		visit sign_up_path 

		fill_in 'user_first_name', with: user_1.first_name
		fill_in 'user_last_name', with: user_1.last_name
		fill_in 'user_user_name', with: user_1.user_name
		fill_in 'user_email', with: user_1.email
		fill_in 'user_password', with: user_1.password
		fill_in 'user_password_confirmation', with: user_1.password_confirmation
		fill_in 'user_nearest_town', with: user_1.nearest_town

		click_button 'Create my Account'
	end

	subject { page }

#	it_should_behave_like 'forum index page'
	
	it '' do
		sleep 89898
	end

end