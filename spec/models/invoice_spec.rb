require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { should have_many(:line_items) }
  it { should accept_nested_attributes_for(:line_items) }

  it { should validate_presence_of(:subtotal) }
  it { should validate_presence_of(:tax) }
  it { should validate_presence_of(:total) }
end
