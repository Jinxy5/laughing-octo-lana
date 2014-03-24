
base_title = 'Blood Bikes Wales | '

shared_examples 'sign up page' do 
	its(:title){ should eq base_title + 'Sign up' }
	its(:body){ should include 'New user' }
end

shared_examples 'sign in page' do
	its(:title){ should eq base_title + 'Sign in' }
	its(:body){ should include 'Sign in here' }
end

shared_examples 'user profile page' do
	its(:title){ should eq base_title + in_example_user }
	its(:body){ should include 'Your private details' }
end




####
shared_examples 'signed in' do
	it { should have_link('Sign Out')}
 # more here
end


shared_examples 'signed out' do
	its(:body){ should include 'Sign in' }

#	its(:body){ should include 'SIGN IN'}
#	its(:body){ should include 'SIGN UP'}
#	it { should have_link('SIGN IN')}
#	it { should have_link('SIGN UP')}
end