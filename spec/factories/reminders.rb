# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reminder do
    task nil
    user nil
    expiry_datetime "2013-09-29 14:51:12"
  end
end
