class CreateEmploymentDetails < ActiveRecord::Migration
  def change
    create_table :employment_details do |t|
      t.string :company_name
      t.string :location
      t.string :designation
      t.timestamps null: false
    end
  end
end
