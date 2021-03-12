FactoryBot.define do
  factory :broker do
    first_name {"Rio"}
    last_name {"Sevilla"}
    email { Faker::Internet.email }
    password {"helloworld"}
    password_confirmation {"helloworld"}
    approved {false}
  end
end
