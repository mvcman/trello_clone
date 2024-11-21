class CreateUserTenants < ActiveRecord::Migration[7.1]
  def change
    create_table :user_tenants, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :tenant, null: false, foreign_key: true, type: :uuid
      t.string :role

      t.timestamps
    end
  end
end
