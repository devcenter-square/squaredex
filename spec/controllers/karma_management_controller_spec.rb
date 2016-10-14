require 'rails_helper'

describe Api::V1::KarmaManagementController, type: :controller do

  let(:user){ create(:user) }
  let(:admin){ create(:user, :admin) }

  describe 'unauthenticated' do

    describe 'GET#index' do
      it 'does not permit access' do
        get :index
        expect(response.status).to eq 401
      end
    end

  end

end