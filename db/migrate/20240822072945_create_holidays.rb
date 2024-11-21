class CreateHolidays < ActiveRecord::Migration[7.1]
  def change
    create_table :holidays, id: :uuid do |t|
      t.string :name, null: false 
      t.date :start_date, null: false 
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
