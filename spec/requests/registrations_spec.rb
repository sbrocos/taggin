# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "POST /registrations" do
    let(:valid_params) do
      {
        user: {
          email_address: "test@example.com",
          username: 'artist',
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    let(:invalid_params) do
      {
        user: {
          email_address: "not-an-email",
          username: 'a',
          password: "pass",
          password_confirmation: "mismatch"
        }
      }
    end

    context "with valid parameters" do
      it "creates a new user" do
        expect {
          post signup_path, params: valid_params
        }.to change(User, :count).by(1)

        expect(response).to have_http_status(:found) # Status 302 (redirect)
        expect(response).to redirect_to(you_root_path) # Cambia según tu implementacion

        follow_redirect!
        expect(response.body).to include('Successfully signed up!')
      end
    end

    context "with invalid parameters" do
      it "does not create a user" do
        expect {
          post signup_path, params: invalid_params
        }.to_not change(User, :count) # El número de usuarios no debe cambiar

        # Aseguramos que se re-renderiza la vista correspondiente
        expect(response).to have_http_status(:unprocessable_entity) # Normalmente 422
        expect(response.body).to include('Error(s) prohibited it from being saved:')
      end
    end
  end
end
