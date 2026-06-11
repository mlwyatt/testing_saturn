require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can be valid' do
    expect(build(:user)).to(be_valid)
  end

  it 'can be invalid' do
    expect(build(:user, username: nil)).to(be_invalid)
  end
end
