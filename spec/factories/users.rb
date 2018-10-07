FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'password'
    password_confirmation 'password'

    trait :user_without_email do
      email ''
    end

    trait :user_with_incorrect_password_confirmation do
      password_confirmation 'passwords'
    end
  end
end
