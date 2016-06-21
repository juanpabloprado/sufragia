module ApplicationHelper
  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block)}
    uri = URI.parse(ENV['FAYE_SERVER_URL'])
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
