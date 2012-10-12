# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sys_user_group do
    user_group_name "sales"
    short_note "corp sales"
  end
end
