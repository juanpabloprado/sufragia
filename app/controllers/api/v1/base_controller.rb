class Api::V1::BaseController < ApplicationController
  include Toll::Controllers::Authenticable
  protect_from_forgery with: :null_session

end
