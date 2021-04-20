class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.integer :events_attended
      t.integer :attendees

      t.timestamps
    end
  end
end
