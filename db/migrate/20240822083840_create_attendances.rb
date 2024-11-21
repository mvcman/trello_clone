class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :attendance_status, null: false, foreign_key: true, type: :uuid
      t.datetime :check_in_time
      t.datetime :check_out_time

      t.timestamps
    end
  end
end
