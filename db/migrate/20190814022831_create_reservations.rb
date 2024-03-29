class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
