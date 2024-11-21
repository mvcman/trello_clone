class CreateLeafs < ActiveRecord::Migration[7.1]
  def change
    create_table :leafs, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.datetime :start_date, null: false 
      t.datetime :end_date, null: false 

      t.timestamps
    end
  end
end
