class PagesController < ApplicationController
  def index
    @campaigns = Campaign.limit(10)
  end
end
