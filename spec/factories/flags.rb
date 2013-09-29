# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :flag, :class => 'Flags' do
    user nil
    new_user false
  end
end
