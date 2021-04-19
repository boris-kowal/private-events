class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :place

      t.timestamps
    end
  end
end
