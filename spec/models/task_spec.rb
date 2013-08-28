require 'spec_helper'

describe Task do
	before(:each) do
		@task = FactoryGirl.build(:task)
	end

	subject { @task }

	it { should be_valid }
	it { should respond_to :name }
	it { should respond_to :start_date }
	it { should respond_to :category }
	it { should respond_to :user }
	it { should respond_to :course }
	it { should respond_to :description }

	describe "when name is not present" do
		before { @task.name = "" }
		it {should_not be_valid}
	end

	describe "when start_date is not present" do
		before { @task.start_date = nil }
		it {should_not be_valid}
	end

end
