class CampaignsController < ApplicationController
  before_action :authenticate_user!

  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      redirect_to campaign_path(@campaign)
    else
      render 'new'
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  private

    def campaign_params
      params.require(:campaign).permit(
        :name,
        :description,
        :category,
        options_attributes: [:id, :option, :description, :_destroy])
    end
end
