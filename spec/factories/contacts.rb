require 'faker'

FactoryGirl.define do
  factory :contact, class: Contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    user_id 1
  end

  factory :contact_other, class: Contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    user_id 1
  end

  factory :contact_invalid, class: Contact do
    name { Faker::Name.name }
    email ""
    user_id 1
  end

  factory :contact_same_email_one, class: Contact do
    name { Faker::Name.name }
    email "test@example.com"
    user_id 1
  end

  factory :contact_same_email_two, class: Contact do
    name { Faker::Name.name }
    email "test@example.com"
    user_id 2
  end

  factory :contact_same_email_three, class: Contact do
    name { Faker::Name.name }
    email "test@example.com"
    user_id 1
  end
end
