class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :category, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
