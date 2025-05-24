class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :tip

  validates :comment, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  validates :tip_id, presence: true
end
