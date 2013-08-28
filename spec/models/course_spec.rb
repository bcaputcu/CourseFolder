require 'spec_helper'

describe Course do
	before(:each) do
		@course = FactoryGirl.build(:course)
	end

	subject { @course }

	it { should be_valid }
	it { should respond_to :name}
	it { should respond_to :school}
	it { should respond_to :instructor}

	describe "when name is not present" do
		before { @course.name = "" }
		it {should_not be_valid}
	end

end
