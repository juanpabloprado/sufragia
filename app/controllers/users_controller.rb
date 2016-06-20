class UsersController < ApplicationController
  before_action :authenticate_user!

  def send_phone_confirmation_token

  end
end
