require 'spec_helper'

describe 'Authentication' do
  
  it 'should have the correct rel_url' do
    Uceem::Authentication.rel_url.should == '/api/login'
  end

  context 'begin session' do

    before { Uceem::Authentication.end_session }

    context 'errors' do

      it 'should raise an AuthenticationError without an email' do
        -> { Uceem::Authentication.begin_session(nil, :password) }.should raise_error
      end

      it 'should raise an AuthenticationError without a password' do
        -> { Uceem::Authentication.begin_session('user@example.com', nil) }.should raise_error
      end

      it 'should raise an AuthenticationError without a password or email' do
        -> { Uceem::Authentication.begin_session }.should raise_error
      end
    end

    context 'with invalid credentials' do

      before do
        begin 
          Uceem::Authentication.begin_session(:invalid_email, :invalid_password)
        rescue Uceem::AuthenticationError
        end
      end

      it 'should not have created an auth_token' do
        Uceem.auth_token.should be_nil
      end

      it 'should not have been a successful response' do
        Uceem.success?.should be_false
      end
    end

    context 'with valid credentials' do

      before { Uceem::Authentication.begin_session(EMAIL, PASSWORD) }

      it 'should have created a valid auth_token' do
        Uceem.auth_token.should be
      end

      it 'should have had a successful response' do
        Uceem.success?.should be_true
      end
    end
  end
end