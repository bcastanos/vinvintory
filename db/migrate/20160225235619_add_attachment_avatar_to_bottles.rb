class AddAttachmentAvatarToBottles < ActiveRecord::Migration
  def self.up
    change_table :bottles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :bottles, :avatar
  end
end
