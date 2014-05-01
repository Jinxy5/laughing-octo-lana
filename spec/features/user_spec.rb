require 'spec_helper'

describe 'user spec', js: true do
	# time
	# time
	# elap
	# now + elap
	Capybara.javascript_driver = :selenium


	let(:user_1){FactoryGirl.build(:user)}
	subject { page }

	
	describe 'a user can sign up' do	
		before do 
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


	end	

	describe 'the edit page should display the users details' do
		before do
			visit sign_up_path 
		
			fill_in 'user_first_name', with: user_1.first_name
			fill_in 'user_last_name', with: user_1.last_name
			fill_in 'user_user_name', with: user_1.user_name
			fill_in 'user_email', with: user_1.email
			fill_in 'user_password', with: user_1.password
			fill_in 'user_password_confirmation', with: user_1.password_confirmation
			fill_in 'user_nearest_town', with: user_1.nearest_town

			click_button 'Create my Account'

			click_button 'Edit Your Details' 
		end

		specify{ should have_content 'Edit Your Profile' }
		

		specify{ find_field('First Name').value.should eq user_1.first_name }
		it{ should have_content user_1.last_name }
		it{ should have_content user_1.user_name }
		it{ should have_content user_1.email }
		it{ should have_content user_1.nearest_town }
						
	end

 
	describe 'a user can update their profile' do
		before do
			visit sign_up_path 
		
			fill_in 'user_first_name', with: user_1.first_name
			fill_in 'user_last_name', with: user_1.last_name
			fill_in 'user_user_name', with: user_1.user_name
			fill_in 'user_email', with: user_1.email
			fill_in 'user_password', with: user_1.password
			fill_in 'user_password_confirmation', with: user_1.password_confirmation
			fill_in 'user_nearest_town', with: user_1.nearest_town

			click_button 'Create my Account'

			click_button 'Edit Your Details' 

		end
	end	

	describe 'a user can be culminate themselves' do
		before do

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

		context 'the instance' do
			subject { user_1.reload }
			its(:state) { should eq 'unregistered' }
			its(:register_key) { should_not be_nil }
		end



		describe 'when visiting culminating' do
			before do
				visit_link
			end
		end




	end
end