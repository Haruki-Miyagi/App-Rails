class Post < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, presence: true
  validates :image, presence: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  paginates_per 3
end
