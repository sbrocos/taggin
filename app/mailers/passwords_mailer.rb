# frozen_string_literal: true

# Mailer when the user need reset the password of him account
class PasswordsMailer < ApplicationMailer
  def reset(user)
    @user = user
    mail subject: 'Reset your password', to: user.email_address
  end
end
