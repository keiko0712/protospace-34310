class Prototype < ApplicationRecord

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :concept, presence: true, unless: :was_attached?
  validates :title, :catch_copy, :concept, presence: true


  def was_attached?
    self.image.attached?
  end

end
