class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.bigint :owner_id
      t.string :name
      t.string :place
      t.datetime :start_at
      t.datetime :end_at
      t.text :content

      t.timestamps

      add_index :events, :owner_id
    end
  end
end
