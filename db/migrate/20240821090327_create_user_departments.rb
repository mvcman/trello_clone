class CreateUserDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :user_departments, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :department, null: false, foreign_key: true, type: :uuid
      t.string :role

      t.timestamps
    end
  end
end
