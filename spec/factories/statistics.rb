# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :statistic, :class => 'Statistics' do
    user nil
    tasks_created 1
    reminders_expired 1
    tasks_completed 1
  end
end
