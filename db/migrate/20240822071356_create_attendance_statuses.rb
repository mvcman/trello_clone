class CreateAttendanceStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :attendance_statuses, id: :uuid do |t|
      t.string :name, null: false
      t.integer :theme, null: false, default: 0

      t.timestamps
    end
  end
end
