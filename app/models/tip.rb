class Tip < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  validates :title, presence: true
  validates :detail, presence: true
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
