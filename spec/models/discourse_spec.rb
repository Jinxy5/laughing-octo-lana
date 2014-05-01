require 'spec_helper'

describe Discourse do
  let!(:user_1){ FactoryGirl.create(:user) }
  let!(:user_2){ FactoryGirl.create(:user) }
  let!(:user_3){ FactoryGirl.create(:user) }
  let!(:user_4){ FactoryGirl.create(:user) }

  let!(:discourse){ FactoryGirl.create(:discourse, user_id: user_1.id) }


  subject { discourse }

  it { should have_many :discourse_replies }
  it { should have_many :replies }

  it { should have_many :reply_retorts }
  it { should have_many :retorts }

  context 'with a reply to a discourse' do
    pending
	let(:discourse_reply_1){ FactoryGirl.build(:discourse, user_id: user_2.id) }

  	before do
  		discourse.replies.create( discourse_reply_1 )
  	end

  	its(:replies){ should include discourse_reply_1 }

  end


  context 'with a discourse, a reply and a retort' do
    let!(:discourse){ FactoryGirl.create(:discourse) }
    let!(:reply){ discourse.replies.create }
    let!(:retort){ discourse.retorts.create }
    
    describe '#is_discourse?' do

      subject { discourse }

      its(:is_discourse?){ should be_true }
      its(:is_reply?){ should be_false }
      its(:is_retort?){ should be_false }
      
    end

    describe '#is_reply?' do
   
      subject { reply }

      its(:is_discourse?){ should be_false }
      its(:is_reply?){ should be_true }
      its(:is_retort?){ should be_false }
      
    end

    describe '#is_retort?' do
      
      subject { retort }

      its(:is_discourse?){ should be_false }
      its(:is_reply?){ should be_false }
      its(:is_retort?){ should be_true }
      
    end
  end

end
