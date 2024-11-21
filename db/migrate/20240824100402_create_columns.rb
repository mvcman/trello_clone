class CreateColumns < ActiveRecord::Migration[7.1]
  def change
    create_table :columns, id: :uuid do |t|
      t.string :name
      t.text :description
      t.string :color 
      t.references :project, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
