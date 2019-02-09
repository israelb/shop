FactoryBot.define do
  factory :invoice do
    subtotal { "1000.00" }
    tax { "50.00" }
    total { "1050.00" }
  end
end
