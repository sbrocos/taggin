# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions' do
  let(:user) { create(:user, email_address: 'artist@example.com', username: 'artist') }
  let(:valid_params) do
    {
      user: {
        email_address: 'artist@example.com',
        password: 'password123'
      }
    }
  end

  describe 'GET /session (new)' do
    it 'returns http success' do
      get new_session_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /session (create)' do
    before { user }

    context 'with valid credentials' do

      it 'authenticates the user and redirects to the post-authentication URL' do
        post session_path, params: valid_params
        expect(response).to redirect_to(albums_path)
      end
    end

    context 'with invalid credentials' do
      let(:invalid_params) { { user: { email_address: user.email_address, password: 'wrongpassword' } } }

      it 'does not authenticate the user and redirects to new session path with an alert' do
        post session_path, params: invalid_params
        expect(response).to redirect_to(new_session_path)
        follow_redirect!
        expect(response.body).to include('Try another email address or password')
        expect(session[:user_id]).to be_nil
      end
    end
  end

  describe 'DELETE /session (destroy)' do
    before do
      # Simula el inicio de sesión
      post session_path, params: { user: { email_address: user.email_address, password: 'password123' } }
    end

    it 'destroys the session and redirects to the login page' do
      delete session_path
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(new_session_path)
    end
  end
end
