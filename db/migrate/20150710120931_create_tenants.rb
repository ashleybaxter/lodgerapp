class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :second_name
      t.string :house_phone
      t.string :mobile_phone
      t.string :email
      t.date :rent_start_date
      t.string :rent_frequency
      t.string :tenancy_term
      t.string :tenancy_agreement

      t.timestamps
    end
  end
end
