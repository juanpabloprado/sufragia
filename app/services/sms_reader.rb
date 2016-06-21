class SmsReader
  attr_reader :raw_text
  attr_accessor :message_id, :text, :from

  def initialize(attributes)
    @message_id = attributes[:message_id]
    @text = attributes[:text]
    @from = attributes[:from]
  end

  def campaign_option
    @text.split(' ')[1].to_i - 1
  end

  def user_zip_code
    @text.split(' ')[1]
  end

  def pin_code_assignment
    @text.split(' ')[2]
  end

  def is_vote_hook?
    @text.split(' ').first.downcase == "/votar"
  end

  def is_user_creation_hook?
    @text.split(' ').first.downcase == "/cuenta"
  end

end
