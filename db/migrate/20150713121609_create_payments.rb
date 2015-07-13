class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :rent_amount
      t.decimal :deposit
      t.boolean :deposit_received
      t.integer :tenant_id

      t.timestamps
    end
  end
end
