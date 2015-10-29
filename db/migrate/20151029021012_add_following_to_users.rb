class AddFollowingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :following_count, :string
  end
end
