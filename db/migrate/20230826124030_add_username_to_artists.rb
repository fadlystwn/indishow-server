class AddUsernameToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :username, :string
    add_index :artists, :username
  end
end
