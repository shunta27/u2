require 'rails_helper'

RSpec.describe InquiryController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #confirm' do
    before do
      allow(InquirySend).to receive_message_chain(:send_admin_mail, :deliver_now)
    end
    subject {
      post :confirm, params: {
        inquiry: {
          name: 'test',
          email: Faker::Internet.email,
          body: 'test message'
        }
      }
    }
    it 'returns http redirect' do
      subject
      expect(response).to have_http_status(:redirect)
      expect(InquirySend).to have_received(:send_admin_mail).once
      expect(InquirySend.send_admin_mail).to have_received(:deliver_now).once
    end
  end

end