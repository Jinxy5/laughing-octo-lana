require 'spec_helper'

describe 'forum spec', js: true do
	Capybara.javascript_driver = :selenium

	before { visit forums_path }
	subject { page }

	it_should_behave_like 'forum index page'

	describe '' do
		
	end


end