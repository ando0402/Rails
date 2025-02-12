class AddProviderToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :provider, :string, after: :users.email
    add_column :users, :uid, :string, after: :users.provider
    add_column :users, :image_url, :string, after: :users.uid
    add_index :users, %i[provider uid], unique: true
  end
end
