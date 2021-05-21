require 'rails_helper'

# Test variables
name = 'push-ups'
short_name = 'u'
category = 'chest'
short_cat = 'x'
image = 'some_url'

RSpec.describe Movement, type: :model do
  it 'is valid with valid attributes' do
    movement = Movement.new(name: name, category: category, image: image)
    expect(movement).to be_valid
  end

  it 'is not valid without attributes' do
    movement = Movement.new
    expect(movement).to_not be_valid
  end

  it 'is not valid without name' do
    movement = Movement.new(category: category, image: image)
    expect(movement).to_not be_valid
  end

  it 'is not valid without category' do
    movement = Movement.new(name: name, image: image)
    expect(movement).to_not be_valid
  end

  it 'is not valid without image' do
    movement = Movement.new(name: name, category: category)
    expect(movement).to_not be_valid
  end

  it 'is not valid without short name' do
    movement = Movement.new(name: short_name, category: category, image: image)
    expect(movement).to_not be_valid
  end

  it 'is not valid without short category' do
    movement = Movement.new(name: name, category: short_cat, image: image)
    expect(movement).to_not be_valid
  end
end
