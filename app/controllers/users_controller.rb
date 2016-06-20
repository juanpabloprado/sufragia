class UsersController < ApplicationController
  before_action :authenticate_user!

  def validate_confirmation_phone_number
    if current_user.has_correct_confirmation_code?(params[:user][:phone_confirmation_token])
      current_user.confirm!
      redirect_to root_path
    else
      redirect_to confirm_user_path(current_user), notice: "El codigo no coincide"
    end
  end

  def confirm
  end
end
