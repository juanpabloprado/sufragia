class Api::V1::VotesController < Api::V1::BaseController
  before_action :authenticate!

  def create
    campaign = Campaign.find(params[:campaign_id])
    vote = current_user.votes.build(option_id: params[:option_id])

    if vote.save
      render json: vote
    else
      render json: { vote: { errors: vote.errors }}, status: :unprocessable_entity
    end
  end
end
