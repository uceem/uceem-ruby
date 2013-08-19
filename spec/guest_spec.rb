require 'spec_helper'

describe 'Guest' do

  it 'should have the correct rel_url' do
    Uceem::Guest.rel_url.should == '/guests'
  end

  context 'without authenticating' do

    before { reset_login }

    it 'should raise an AuthenticationError' do
      -> { Uceem::Guest.index }.should raise_error
    end
  end

  context 'after authenticating' do

    before { login }

    it 'should not raise an AuthenticationError' do
      -> { Uceem::Guest.index }.should_not raise_error
    end

    context 'the index' do
      
      before(:each) { Uceem::Guest.index }

      it 'should have been successful' do
        Uceem.success?.should be_true
      end

      it 'should have the proper guests' do
        Uceem.last_response.count.should == 1
        Uceem.last_response.first['email'].should == 'an_awesome_test_guest@uceem.com'
      end
    end
  end
end