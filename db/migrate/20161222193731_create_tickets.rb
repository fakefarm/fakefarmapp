class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :summary
      t.string :ticket
      t.string :merge
      t.date :date_due
      t.date :date_started
      t.date :date_completed
      t.boolean :started
      t.boolean :trashed
      t.boolean :paused
      t.boolean :blocked
      t.boolean :completed

      t.timestamps
    end
  end
end
