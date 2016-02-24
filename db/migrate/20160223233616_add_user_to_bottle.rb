class AddUserToBottle < ActiveRecord::Migration
  def change
    add_reference :bottles, :user, index: true, foreign_key: true
  end
end
