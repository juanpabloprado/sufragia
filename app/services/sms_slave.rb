class SmsSlave

  def self.message_to_new_user(user)
    TEXT_MAGIC_API.send "Tu cuenta en Sufragia ha sido creada satisfactoriamente.", user.phone_with_country_code 
  end

  def self.successful_vote(user)
    TEXT_MAGIC_API.send "Tu voto ha sido reflejado en Sufragia.", user.phone_with_country_code 
  end

  def self.campaign_vote_request(campaign, user)
    options = campaign.options.map.with_index {|o, index| "#{index + 1}=#{o.option}" }.join(" ")
  	TEXT_MAGIC_API.send %Q{
    #{campaign.id} - Pregunta: #{campaign.name}

      #{options}

      Responde con alguno de los valores: /votar opcion
}, user.phone_with_country_code
  end

end
