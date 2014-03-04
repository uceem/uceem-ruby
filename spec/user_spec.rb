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

    before { login }

    it 'should not raise an AuthenticationError' do
      -> { Uceem::User.index }.should_not raise_error
    end
  end
end
