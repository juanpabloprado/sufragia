class Api::V1::SessionsController < Api::V1::BaseController
  before_action :authenticate!, only: [:destroy]

  def create
    # session: {
    #  email: "email@example.com",
    #  password: "12345678"
    # }

    user_phone_number = params[:session][:phone_number]
    user_password = params[:session][:password]

    user = user_phone_number.present? && User.find_by(phone_number: user_phone_number)
    # => user
    # => nil

    if user && user.valid_password?(user_password)
        # the authenticate_with_token is provided by the Toll gem
      user.authenticate_with_token
      render json: user, status: :ok
    else
      render json: { session: { errors: "Invalid phone number or password" }}, status: :unprocessable_entity
    end
  end

  def destroy
     # the sign_out is provided by the Toll gem
     # it is an alias for the authenticate_with_token
    current_user.sign_out
    head :no_content
  end
end
