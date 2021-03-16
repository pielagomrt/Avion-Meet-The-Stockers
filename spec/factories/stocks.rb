FactoryBot.define do
  factory :stock do
    ticker {"AMZN"}
    company {"Amazon"}
    price { 120 }
  end
end
