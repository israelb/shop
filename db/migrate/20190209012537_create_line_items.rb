class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :invoice, foreign_key: true
      t.string :name
      t.integer :qty
      t.decimal :price
      t.decimal :total

      t.timestamps
    end
  end
end
