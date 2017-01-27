class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }             #################3
  #mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true , length: { maximum: 140 }
  #validate  :picture_size

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  validates :tag_list, length: { maximum: 3, :message=>"should have no more than 3 tags" }

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
