# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sys_module do
    module_name "my_module"
    position_group "eng_group"
  end
end
