require 'rails_helper'

# Test variables
user_id = 1
movement_id = 2

RSpec.describe TrackedMovement, type: :model do
  it 'is not valid without attributes' do
    tracked_movement = TrackedMovement.new
    expect(tracked_movement).to_not be_valid
  end

  it 'is not valid without user id' do
    tracked_movement = TrackedMovement.new(movement_id: movement_id)
    expect(tracked_movement).to_not be_valid
  end

  it 'is not valid without movement id' do
    tracked_movement = TrackedMovement.new(user_id: user_id)
    expect(tracked_movement).to_not be_valid
  end
end
