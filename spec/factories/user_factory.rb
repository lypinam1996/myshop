FactoryGirl.define do
  factory :user do
    email "1@mail.ru"
    full_name "Maria"
    password "111"
    password_confirmation "111"
    role true
 end 
end
