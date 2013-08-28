# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
		sequence(:name) {|n| "Task #{n}"}
		start_date {1.day.from_now.strftime("%d/%m/%Y").to_s}
		category 'Homework'
		user
		course
		sequence(:description) {|n| "Description #{n}"}
  end
end
