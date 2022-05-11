class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :brand_name
      t.string :corporate_name
      t.integer :registered_number
      t.string :full_address
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
