require 'spec_helper'

describe User do
	before(:each) do
		@user = User.new(FactoryGirl.attributes_for(:user))
	end

	subject { @user }

	it { should be_valid }
	it { should respond_to :email}

end
