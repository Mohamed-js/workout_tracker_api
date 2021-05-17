class User < ApplicationRecord
    has_many :tracked_movements
    has_many :movements, through: :tracked_movements

    def self.top_score
        
    end
    
end
