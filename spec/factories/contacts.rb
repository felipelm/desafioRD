require 'faker'

FactoryGirl.define do
  factory :contact, class: Contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
