class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:receive_sms]

  def receive_sms
    #{"message_id"=>"753638", 
    # "text"=>"Callback URL test for user edolopez",
    # "timestamp"=>"1411880238", 
    # "from"=>"9991234567", 
    # "controller"=>"webhooks",
    # "action"=>"twitter"}
    #
    head :ok
    sms_reader = SmsReader.new(params) 

    user = User.find_by(phone_number: sms_reader.from[2..-1])

    if user.present?
      if sms_reader.is_vote_hook? 
      	last_campaign = Campaign.find(user.last_campaign_id)
      	option_selected = last_campaign.options[sms_reader.campaign_option]
      	user.votes.create(option_id: option_selected.id)
      	user.update_attribute(:last_campaign_id, nil)
        SmsSlave.successful_vote(user)
      end
    end
  end
end
