require 'spec_helper'

describe Enrollment do
	before(:each) do
		@enrollment = FactoryGirl.build(:enrollment)
	end

	subject { @enrollment }

	it { should be_valid }
	it { should respond_to :user}
	it { should respond_to :course}

	describe "when user enrolls same course" do
		before do
			enrolled_user = @enrollment.dup
			enrolled_user.save
		end
		it {should_not be_valid}
	end

end
