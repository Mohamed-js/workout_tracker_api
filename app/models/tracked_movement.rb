class TrackedMovement < ApplicationRecord
    belongs_to :user, class_name: "User"
    belongs_to :movement, class_name: "Movement"
end
