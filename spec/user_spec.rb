require 'rails_helper'

# Test variables
name = 'mohameeed'
short_name = 'mo'
password = '123456'
birth_date = 'somedate'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: name, password: password, birth_date: birth_date)
    expect(user).to be_valid
  end

  it 'is not valid without attributes' do
    user = User.new
    expect(user).to_not be_valid
  end

  it 'is not valid without name' do
    user = User.new(password: password)
    expect(user).to_not be_valid
  end

  it 'is not valid without password' do
    user = User.new(name: name)
    expect(user).to_not be_valid
  end

  it 'is not valid with short name' do
    user = User.new(name: short_name, password: password)
    expect(user).to_not be_valid
  end
end
