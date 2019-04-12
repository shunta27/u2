require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:test_user) { create(:base_user) }

  before do
    login_user test_user
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, { id: test_user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unsubscribe" do
    it "returns http success" do
      get :unsubscribe, { id: test_user.id }
      expect(response).to have_http_status(:success)
    end
  end

end
