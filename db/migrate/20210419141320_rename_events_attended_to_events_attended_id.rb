class RenameEventsAttendedToEventsAttendedId < ActiveRecord::Migration[6.1]
  def change
    rename_column :subscriptions, :events_attended, :events_attended_id
    rename_column :subscriptions, :attendees, :attendees_id
  end
end
