class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :total

      t.timestamps
    end
  end
end
