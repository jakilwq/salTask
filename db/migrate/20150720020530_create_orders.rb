class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :stripe_id
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
