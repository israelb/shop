FactoryBot.define do
  factory :line_item do
    invoice { nil }
    name { "MyString" }
    qty { 1 }
    price { "9.99" }
    total { "9.99" }
  end
end
