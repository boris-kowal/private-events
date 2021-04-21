class AddInvitedUsersToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :invited_users, :string
  end
end
