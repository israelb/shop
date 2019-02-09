FactoryBot.define do
  factory :line_item do
    invoice { nil }
    name { "MacBook Pro" }
    qty { 1 }
    price { "1000.00" }
    total { "1000.00" }
  end
end
