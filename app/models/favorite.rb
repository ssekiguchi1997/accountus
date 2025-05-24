class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :tip

  validates :user_id, presence: true
  validates :tip_id, presence: true

  validates :user_id, uniqueness: {scope: :tip_id}

  # Ensure a user can only favorite a tip once
  # validates_uniqueness_of :tip_id, scope: :user_id
  
end
