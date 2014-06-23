class AddAwesomeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :awesome, :boolean, default: false
  end
end
