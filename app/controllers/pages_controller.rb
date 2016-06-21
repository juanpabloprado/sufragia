class PagesController < ApplicationController
  def index
    @campaigns = Campaign.limit(10)
    @last_vote = Vote.last
  end
end
