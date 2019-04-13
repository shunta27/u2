require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:test_login_user) { create(:base_user) }

  describe 'GET #show' do
    it 'returns http success' do
      get :show, { id: test_login_user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #unsubscribe' do
    before do
      login_user test_login_user
    end
    it 'returns http success' do
      get :unsubscribe, { id: test_login_user.id }
      expect(response).to have_http_status(:success)
    end
  end

end
