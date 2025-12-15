# frozen_string_literal: true

#  Controller to manage passwords
class PasswordsController < ApplicationController
  allow_unauthenticated_access
  before_action :set_user_by_token, only: %i[edit update]

  def new; end

  def edit; end

  def create
    if (@user = User.find_by(email_address: user_params[:email_address]))
      PasswordsMailer.reset(@user).deliver_later
      notice_message = t('authentication.passwords.create.success', email: @user.email_address)
    else
      notice_message = t('authentication.passwords.create.failure', email: user_params[:email_address])
    end

    redirect_to new_session_path, notice: notice_message
  end

  def update
    if @user.update(params.permit(:password, :password_confirmation))
      redirect_to new_session_path, notice: 'Password has been reset.'
    else
      redirect_to edit_password_path(params[:token]), alert: 'Passwords did not match.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address)
  end

  def set_user_by_token
    # rubocop:disable Rails/DynamicFindBy
    @user = User.find_by_password_reset_token!(params[:token])
    # rubocop:enable Rails/DynamicFindBy
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to new_password_path, alert: 'Password reset link is invalid or has expired.'
  end
end
