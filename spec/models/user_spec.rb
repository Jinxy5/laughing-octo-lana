require 'spec_helper'

def generate_random_string(characters)
	random_string = []
	all_characters = [*('a'..'z'),*('1'..'9')]

	characters.times do 
		random_string << all_characters.fetch( rand(0..all_characters.length() -1 ) )
	end

	random_string.join
end

def gen_too_short_password(a = {})
	o = {
		characters: 0
	}.merge!(a)
	
	password = Faker::Internet.password 
	password_length = password.length

	password = password[0..o[:characters]]
end



describe User do
  describe 'when all attributes are valid and present' do
	let(:user){ FactoryGirl.build(:user) }
	subject { user }

	it { should respond_to :email } 
	it { should respond_to :user_name } 
	it { should respond_to :password }
	it { should respond_to :password_confirmation }

	it { should respond_to :password_digest } 
	it { should be_valid }

	it { should respond_to :authenticate }
  end

  describe 'when password is not present' do
  	let(:user){ FactoryGirl.build(:user, password: '')}
  	subject { user }

  	it { should_not be_valid }
  end
  
  describe 'when password confirmation does not match password' do
  	let(:user){ FactoryGirl.build(:user, password: Faker::Internet.password )}
  	subject { user }

  	it { should_not be_valid }
  end

  describe 'when password is too short' do
  	password = generate_random_string(1)
  	

  	let(:user){ FactoryGirl.build(:user, password: password, password_confirmation: password )}
  	subject { user }

  	it { should_not be_valid }
  end

  describe 'when password is too long' do
  	password = generate_random_string(200)	

  	let(:user){ FactoryGirl.build(:user, password: password, password_confirmation: password )}
  	subject { user }

  	it { should_not be_valid }
  end

  describe 'when email is invalid' do
  	let(:user){ FactoryGirl.build(:user, email: 'jimboluu')}
  	subject { user }

  	it { should_not be_valid }

  	let(:user){ FactoryGirl.build(:user, email: 'jimboluu @ awesp,e ')}
  	subject { user }

  	it { should_not be_valid }
  end

  describe 'when valid email is in capitals' do
  	let(:uppercase_email){ Faker::Internet.email.upcase }

    let(:user){ FactoryGirl.create(:user, email: uppercase_email ) }

  	subject { user }

  	it { should be_valid }

  	subject { user.reload }

  	its(:email) { should eq uppercase_email.downcase }
  end


end
