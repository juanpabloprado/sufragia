class SMSApi
  def self.send_confirmation_code_to_user(confirmation_code, user_phone)
    TEXT_MAGIC_API.send "Bienvenido a Sufragia. Tu codigo de confirmacion para es #{confirmation_code}", user_phone
  end
end
