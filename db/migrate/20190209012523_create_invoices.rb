class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.decimal :subtotal, precision: 8, scale: 2, default: 0.00
      t.decimal :tax, precision: 8, scale: 2, default: 0.00
      t.decimal :total, precision: 8, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
