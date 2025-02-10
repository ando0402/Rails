class AddContentToMessage < ActiveRecord::Migration[7.2]
  def change
    add_column :messages, :content, :text, after: :id
  end
end
