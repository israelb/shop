class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :invoice, foreign_key: true
      t.string :name
      t.integer :qty
      t.decimal :price, precision: 8, scale: 2, default: 0.00
      t.decimal :total, precision: 8, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
