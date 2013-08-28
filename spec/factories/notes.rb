# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    content "MyText"
    course nil
    author nil
    title "MyString"
    description "MyString"
  end
end
