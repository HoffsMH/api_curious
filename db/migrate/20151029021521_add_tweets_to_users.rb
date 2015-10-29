class AddTweetsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tweets_count, :string
  end
end
