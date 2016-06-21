class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @campaign = Campaign.find(params[:campaign_id])
    current_user.votes.create(option_id: params[:option_id])
    respond_to do |format|
      format.html { redirect_to campaign, notice: "Tu voto fue emitido" }
      format.js
    end
  end
end
