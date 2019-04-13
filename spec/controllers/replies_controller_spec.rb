require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
  let(:test_login_user) { create(:base_user) }

  let(:category) { create(:base_category) }
  let(:post_data) { create(:base_post,
    category_id: category.id,
    user_id: test_login_user.id
  )}

  describe 'GET #create' do
    before do
      login_user test_login_user
    end
    subject {
      post :create, params: {
        category_id: category.id,
        id: post_data.id,
        reply: {
          post_id: post_data.id,
          body: 'test'
        }
      }
    }
    it 'returns http redirect' do
      subject
      expect(response).to have_http_status(:redirect)
    end
  end

end
