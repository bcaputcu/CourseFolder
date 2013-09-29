# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    user nil
    is_seen false
    content "MyString"
  end
end
