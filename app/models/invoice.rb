class Invoice < ApplicationRecord
  has_many :line_items
  accepts_nested_attributes_for :line_items, allow_destroy: true, reject_if: proc { |att| att['name'].blank? }

  validates_presence_of :subtotal
  validates_presence_of :tax
  validates_presence_of :total
end
