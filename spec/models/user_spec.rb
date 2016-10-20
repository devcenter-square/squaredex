require 'rails_helper'

describe User do

  it { should validate_inclusion_of(:role).in_array(User::ROLES) }

  describe '.admin?' do
    it 'is true for an admin user' do
      admin = build(:user, :admin)
      expect(admin.admin?).to be_truthy
    end

    it 'is false for a non admin user' do
      user = build(:user)
      expect(user.admin?).to be_falsey
    end
  end

end