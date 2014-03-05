require 'spec_helper'

describe 'UceemObject' do

  let(:uceem_object) { Uceem::UceemObject }

  subject { uceem_object }

  it { should respond_to(:new)    }
  it { should respond_to(:get)    }
  it { should respond_to(:index)  }
  it { should respond_to(:update) }
  it { should respond_to(:delete) }
end