class SmsSlave

  def self.create_user(formula, twitter_client, user)
    #creacion de usuario
    TEXT_MAGIC_API.send "Tu cuenta en Sufragia ha sido creada satisfactoriamente.", user.phone_with_country_code 
  end

  def self.successful_vote(user)
    TEXT_MAGIC_API.send "Tu voto ha sido reflejado en Sufragia.", user.phone_with_country_code 
  end

end
