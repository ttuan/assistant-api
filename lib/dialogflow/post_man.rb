class Dialogflow::PostMan
  attr_reader :client, :message

  def initialize message
    @client = ApiAiRuby::Client.new client_access_token: ENV["API_AI_ACCESS_TOKEN"]
    @message = message
  end

  def predicted_message
    parse_response client.text_request(message)
  end

  private
  def parse_response response
    mess = response[:result][:fulfillment][:speech]
    mess.empty? ? Settings.default.message : mess
  end
end
