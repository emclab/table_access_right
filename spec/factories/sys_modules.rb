# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sys_module do
    module_name "my_module"
    module_group_name "eng_group"
  end
end
