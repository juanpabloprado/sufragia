class SmsSlave

  def self.message_to_new_user(user)
    TEXT_MAGIC_API.send "Tu cuenta en Sufragia ha sido creada satisfactoriamente.", user.phone_with_country_code 
  end

  def self.successful_vote(user)
    TEXT_MAGIC_API.send "Tu voto ha sido reflejado en Sufragia.", user.phone_with_country_code 
  end

  def self.campaign_vote_request(campaign, user)
  	TEXT_MAGIC_API.send "#{campaign.id} - Pregunta: ", user.phone_with_country_code 
  end

end
