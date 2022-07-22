class CreateOrdersJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :orders_jobs do |t|
      t.references :order, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
