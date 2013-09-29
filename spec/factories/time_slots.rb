# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_slot do
    section nil
    start_time "2013-09-29 14:55:14"
    end_time "2013-09-29 14:55:14"
    day 1
  end
end
