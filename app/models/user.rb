class User < ApplicationRecord
  has_one_attached :avatar
  validates :name, presence: true
  validate :correct_image_type

  private

  def correct_image_type
    if avatar.attached? && !avatar.content_type.in?(%w(avatar/jpg, avatar/png))
      errors.add(:avatar, "must be a jpg or png")
    elsif avatar.attached? == false
      errors.add(:avatar, "required")
    end  
  end
end
