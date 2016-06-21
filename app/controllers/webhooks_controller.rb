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
    sms_reader = SmsReader.new(params)

    phone_number = sms_reader.from[2..-1]
    user = User.find_by(phone_number: phone_number)

    if user.present?
      if sms_reader.is_vote_hook?
      	@campaign = Campaign.find(user.last_campaign_id)
      	option_selected = @campaign.options[sms_reader.campaign_option]
      	user.votes.create(option_id: option_selected.id)
      	user.update_attribute(:last_campaign_id, nil)
        SmsSlave.successful_vote(user)
      end
    elsif sms_reader.is_user_creation_hook?
      user = User.create(phone_number: phone_number, password: sms_reader.pin_code_assignment)
      user.confirm!
      SmsSlave.message_to_new_user(user)
    end

    respond_to do |format|
      format.js
    end
  end
end
