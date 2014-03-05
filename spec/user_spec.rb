require 'spec_helper'

describe 'User' do

  it 'should have the correct rel_url' do
    Uceem::User.rel_url.should == '/manage/users'
  end

  context 'without authenticating' do

    before { Uceem::Authentication.end_session }

    it 'should raise an AuthenticationError' do
      -> { Uceem::User.index }.should raise_error
    end
  end

  context 'after authenticating' do

    let(:user_email) { 'uceem_gem_test@beta.uceem.com.local' }

    let(:user_index_data) { VCR.use_cassette('user_index') { Uceem::User.index } }

    before do
      login
      user_index_data
    end

    it 'should not raise an AuthenticationError' do
      Uceem.success?.should be_true
    end

    it 'should have the proper users' do
      Uceem.last_response.count.should == 1
      Uceem.last_response.first[:email].should == user_email
    end

    context 'user show' do

      let(:user_show_data) do 
        VCR.use_cassette('user_show') { Uceem::User.get(Uceem.last_response.first[:id]) } 
      end

      before { user_show_data }

      it 'should return the proper user' do
        Uceem.last_response[:email].should == user_email
      end
    end
  end
end
