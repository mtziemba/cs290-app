class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
            length: { minimum: 3 }
  has_attached_file :photo,
  :default_url => "default_image.jpg"
  # :default_url => ":style/default_image.jpg"
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :user
end
