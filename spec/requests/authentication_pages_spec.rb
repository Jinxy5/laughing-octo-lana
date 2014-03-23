require 'spec_helper'

describe 'authentication pages' do
	subject { page }

	describe 'sign in page' do
		before { visit sign_in_path }

		it_should_behave_like 'sign in page'

		describe 'with invalid information' do
			before { click_button 'Sign In'}

			it_should_behave_like 'sign in page'
			it { should have_selector('div.alert.alert-error')}
		end
	end	
end