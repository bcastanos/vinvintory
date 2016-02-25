class Bottle < ActiveRecord::Base

  belongs_to :user
  validates :user_id, presence: true
  validates :qty, presence: true, length: {maximum:3}
  validates :vintage, presence: true, length: {maximum:4}
  validates :wine, presence: true, length: {maximum:50}

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


end
