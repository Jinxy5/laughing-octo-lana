
base_title = ' Blood Bikes Wales | '

shared_examples 'sign up page' do 
	its(:title){ should eq base_title + 'Sign up ' }
	its(:body){ should include 'New user' }
end
