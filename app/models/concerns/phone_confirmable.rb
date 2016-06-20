module PhoneConfirmable
  extend ActiveSupport::Concern

  included do
    before_create :generate_confirmation_code!
    after_create :send_confirmation

    validates :phone_number,
      length: { maximum: 10, minimum: 10 },
      presence: true,
      uniqueness: true
  end

  def has_correct_confirmation_code?(confirmation_code)
    confirmation_code.present? && self.phone_confirmation_token == confirmation_code.to_i
  end

  def confirmed?
    confirmed_at? && phone_confirmation_token.blank?
  end

  def confirm!
    self.update_attributes confirmed_at: DateTime.now, phone_confirmation_token: ""
  end

  def send_confirmation
    SMSApi.send_confirmation_code_to_user self.phone_confirmation_token, phone_with_country_code
  end

  def phone_with_country_code
    "52#{phone_number}"
  end


  private

  def generate_confirmation_code!
    self.phone_confirmation_token = rand.to_s[2..5]
  end

end
