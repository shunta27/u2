require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:test_login_user) { create(:base_user) }
  let(:not_login_user) { create(:base_user) }

  let(:category) { create(:base_category) }
  let(:post_data) { create(:base_post,
    category_id: category.id,
    user_id: test_login_user.id
  )}

  describe 'GET #index' do
    Category.find_each do | category |
      it 'returns http success' do
        get :index, params: { category_id: category.id }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #users_index' do
    it 'returns http success' do
      get :users_index, params: { user_show_id: test_login_user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: post_data.id, user_show_id: test_login_user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    subject { get :new }
    context 'login' do
      before do
        login_user test_login_user
      end
      it 'returns http success' do
        subject
        expect(response).to have_http_status(:success)
      end
    end
    context 'not login' do
      it 'returns http redirect (Pundit::NotAuthorizedError)' do
        subject
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'POST #create' do
    before do
      login_user test_login_user
    end
    subject {
      post :create, params: {
        post: {
          subject: 'test',
          category_id: category.id,
          body: 'test'
        }
      }
    }
    it 'returns http redirect' do
      subject
      expect(response).to have_http_status(:redirect)
    end
    it 'saves the new post data in the database' do
      expect { subject }.to change(Post, :count).by(1)
    end
  end

  describe 'GET #edit' do
    subject {
      get :edit, params: {
        id: post_data.id
      }
    }
    context 'login' do
      before do
        login_user test_login_user
      end
      it 'returns http success' do
        subject
        expect(response).to have_http_status(:success)
      end
    end
    context 'not login' do
      it 'returns http redirect (Pundit::NotAuthorizedError)' do
        subject
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'PATCH #update' do
    before do
      login_user test_login_user
    end
    let(:subject_s) { 'test update subject' }
    let(:body_s) { 'test update body' }
    subject {
      patch :update,
      params: {
        id: post_data.id,
        post: {
          subject: subject_s,
          category_id: category.id,
          body: body_s
        }
      }
    }
    it 'returns http success' do
      subject
      expect(response).to have_http_status(:redirect)
    end
    it 'saves the new post data in the database' do
      subject
      post_data.reload
      expect(post_data.subject).to eq(subject_s)
      expect(post_data.body).to eq(body_s)
    end
  end

end
