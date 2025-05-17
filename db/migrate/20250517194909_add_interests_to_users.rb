class AddInterestsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :interests, :string
  end
end
