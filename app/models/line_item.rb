class LineItem < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :name
  validates_presence_of :qty
  validates_presence_of :price
  validates_presence_of :total
end
