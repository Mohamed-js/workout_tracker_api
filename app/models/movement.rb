class Movement < ApplicationRecord
    has_many :tracked_movements
    has_many :users, through: :tracked_movements
end
