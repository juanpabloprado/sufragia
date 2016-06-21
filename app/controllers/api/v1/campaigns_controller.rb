class Api::V1::CampaignsController < Api::V1::BaseController
  before_action :authenticate!, only: [:create]

  def show
    render json: Campaign.find(params[:id])
  end

  def create
    campaign = Campaign.new(campaign_params)
    if campaign.save
      render json: campaign
    else
      render json: { campaign: { errors: campaign.errors } }
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(
      :name,
      :description,
      :segments => [:zone],
      options_attributes: [:id, :option, :description, :_destroy])
  end
end
