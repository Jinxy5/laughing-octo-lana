require 'spec_helper'

describe 'forums', js: true do
	Capybara.javascript_driver = :selenium
	
	before { visit root_path }
	subject { page }

	let(:user) { FactoryGirl.build(:user) }
	let!(:forum) { FactoryGirl.create(:forum) }
	let(:rider_user) { FactoryGirl.create(:rider_user) }


	describe 'index can be browsed to' do
		before do 
			login_user(user)
			click_link 'Forums'
		end

		it_should_behave_like 'forum index page'	
		
		it{ should have_content forum.name }
		it{ should have_content forum.description }
	end

	describe 'individual forum can be browsed to' do
		context 'with user who doesn\'t have the correct role' do
			before do
				login_user(user)
				click_link 'Forums'	
				click_link forum.name
			end

			it{ should have_selector('.alert', text: 'Sorry! You cannot enter this forum! This forum is for users with a type of: rider and your roles are: potential' ) }

		end


		context 'with user who does have the correct role:' do
			before do
				login_user(rider_user, create: false)
				click_link 'Forums'
				click_link forum.name
			end

			it_should_behave_like 'forum show page', 'rider'
		end
	end


	describe 'a new discussion can be created' do
		let(:discussion){ FactoryGirl.build(:discussion) }

		before do
			login_user(rider_user, create: false)
			click_link 'Forums'
			click_link forum.name
			fill_in 'discussion_name', with: discussion.name
			fill_in 'discussion_description', with: discussion.description
			click_button 'Create Discussion'
		end

		it_should_behave_like 'forum show page', 'rider'

		it{ should have_selector('.alert', text: 'discussion successfully created!' ) }
		
	end


#	describe 'a'
end