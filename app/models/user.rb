class User < ApplicationRecord
  has_many :tracked_movements
  has_many :movements, through: :tracked_movements

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :password, presence: true, length: { in: 6..20 }
end
