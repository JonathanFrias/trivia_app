class AddStreaksToUsersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :longest_correct_streak, :integer, default: 0
    add_column :users, :longest_incorrect_streak, :integer, default: 0

    add_column :users, :current_correct_streak, :integer, default: 0
    add_column :users, :current_incorrect_streak, :integer, default: 0
  end
end
