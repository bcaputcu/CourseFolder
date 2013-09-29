# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :due_date do
    section nil
    task nil
    expiry_datetime "2013-09-29 14:47:28"
  end
end
