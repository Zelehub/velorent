class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
