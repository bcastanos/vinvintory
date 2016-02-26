class Bottle < ActiveRecord::Base

  belongs_to :user
  validates :user_id, presence: true
  validates :qty, presence: true, length: {maximum:3}
  validates :vintage, presence: true, length: {maximum:4}
  validates :wine, presence: true, length: {maximum:50}



end
