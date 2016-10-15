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

    describe 'PUT#update' do
      it 'does not permit access' do
        put :update, id: '1'
        expect(response.status).to eq 401
      end
    end

  end

  describe 'unauthorized' do
    before do
      authenticate_request user
    end

    describe 'GET#index' do
      it 'has restricted access' do
        get :index
        expect(response.status).to eq 401
      end
    end

    describe 'PUT#update' do
      it 'has restricted access' do
        put :update, id: '1'
        expect(response.status).to eq 401
      end
    end
  end

  describe 'authorized' do
    before do
      authenticate_request admin
    end

    describe 'GET#index' do
      it 'has a success response status' do
        get :index
        expect(response.status).to eq 200
      end
    end

    describe 'PUT#update' do
      before do
        @karma_request = create(:karma_request)
        put :update, id: @karma_request.to_param, karma_request: { approved: true }
      end

      it 'assigns requested karma_request' do
        expect(assigns(:karma_request)).to eq @karma_request
      end

      it 'updates karma_requests approval status' do
        expect(KarmaRequest.find(@karma_request.id).approved).to eq true
      end

      it 'has a success response status' do
        expect(response.status).to eq 200
      end
    end
  end

end