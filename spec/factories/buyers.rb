FactoryBot.define do
  factory :buyer do
    first_name {"Rio"}
    last_name {"Sevilla"}
    email { Faker::Internet.email }
    password {"helloworld"}
    password_confirmation {"helloworld"}
    confirmed_at {Time.now}
  end
end