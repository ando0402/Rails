class AddPublisherIdToBooks < ActiveRecord::Migration[7.2]
  def change
    # add_reference :books, :publisher, null: false, foreign_key: true
    add_reference :books, :publisher, null: false, foreign_key: true
  end
end
