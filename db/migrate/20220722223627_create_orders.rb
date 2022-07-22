class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.string :client_name
      t.string :client_phone
      t.string :string
      t.references :worker, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
