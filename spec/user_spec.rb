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

    before do
      login
      Uceem::User.index
    end

    it 'should not raise an AuthenticationError' do
      Uceem.success?.should be_true
    end

    it 'should have the proper users' do
      Uceem.last_response.count.should == 1
      Uceem.last_response.first[:email].should == 'uceem_gem_test@beta.uceem.com.local'
    end
  end
end
