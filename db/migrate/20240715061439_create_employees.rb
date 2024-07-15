class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :employee_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :phone_numbers, array: true, default: []
      t.date :doj
      t.decimal :salary

      t.timestamps
    end
  end
end
