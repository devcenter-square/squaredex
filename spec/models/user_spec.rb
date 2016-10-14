require 'rails_helper'

describe User do

  it { should validate_inclusion_of(:role).in_array(User::ROLES) }

end