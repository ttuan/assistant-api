class Dialogflow::PostMan
  attr_reader :client, :message

  def initialize message
    @client = ApiAiRuby::Client.new client_access_token: ENV["API_AI_ACCESS_TOKEN"]
    @message = message
  end

  def perform
    client.text_request message
  end
end
