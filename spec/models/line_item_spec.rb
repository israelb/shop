require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { should belong_to(:invoice) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:qty) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:total) }
end
