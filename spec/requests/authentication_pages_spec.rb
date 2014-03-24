require 'spec_helper'

describe 'authentication pages', js: true do
	subject { page }

	describe 'sign in page' do
		before { visit sign_in_path }

		it_should_behave_like 'sign in page'

		describe 'with invalid information' do
			before { click_button 'Sign In'}

			it_should_behave_like 'sign in page'
			it { should have_selector('div.alert.alert-success')} # change to error		
		end
	end	


	describe 'sign up page' do
		describe 'with valid information' do
			before { visit sign_up_path }

			let(:user){ FactoryGirl.build(:user) }
			
			before do


				fill_in 'Email', with: user.email
				fill_in 'Password', with: user.password
				fill_in 'Password confirmation', with: user.password_confirmation
				click_button 'Create User'
				
			end

			let(:in_example_user ) { User.find_by(email: user.email).user_name }
			it_should_behave_like 'user profile page'

			it_should_behave_like 'signed in'

		end

		describe 'after saving the user' do

		end

	end


end