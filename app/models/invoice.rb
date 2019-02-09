class Invoice < ApplicationRecord
  has_many :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items, allow_destroy: true

  validates_presence_of :subtotal
  validates_presence_of :tax
  validates_presence_of :total
end
