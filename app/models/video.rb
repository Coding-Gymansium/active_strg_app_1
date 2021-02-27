class Video < ApplicationRecord
  has_one_attached :clip
  has_one_attached :thumbnail
  validates :title, presence: true
  validate :correct_video_type

  private

  def correct_video_type
    if clip.attached? && !clip.content_type.in?(%w(clip/mp4))
      errors.add(:clip, "must be a mp4")
    elsif clip.attached? == false
      errors.add(:clip, "required")
    end
  end
end
