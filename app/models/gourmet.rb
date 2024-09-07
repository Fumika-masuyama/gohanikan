class Gourmet < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_one_attached :photo

  def self.ransackable_attributes(auth_object = nil)
    ["budget", "created_at", "genre", "id", "name", "number", "place", "purpose", "updated_at"]
  end
end