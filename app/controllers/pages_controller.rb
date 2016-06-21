class PagesController < ApplicationController
  def index
    @campaigns = Campaign.limit(3)
  end
end
