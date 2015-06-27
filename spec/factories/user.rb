require 'factory_girl_rails'

 FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end

  factory :user_with_post_and_comment, parent: :user do
    after(:build) { |user| #post true, #comment true
      (user) }
  end
end
