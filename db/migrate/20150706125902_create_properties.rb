class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :house_number
      t.string :street_address
      t.string :street_address_two
      t.string :city
      t.string :postcode

      t.timestamps
    end
  end
end
