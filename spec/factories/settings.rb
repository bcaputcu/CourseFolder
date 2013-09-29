# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :setting, :class => 'Settings' do
    user nil
    default_reminder_seconds 1
    notify_new_tasks false
    notify_new_tasks_without_due_date false
  end
end
