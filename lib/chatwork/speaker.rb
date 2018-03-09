class Chatwork::Speaker
  attr_reader :client, :body, :room_id, :sender_id

  def initialize room_id, sender_id, body
    @client = ChatWork::Client.new api_key: ENV["CHATWORK_API_KEY"]
    @room_id = room_id
    @body = body
    @sender_id = sender_id
  end

  def speak
    client.create_message room_id: room_id, body: full_message
  end

  private
  def full_message
    <<~MESSAGE
      [TO:#{sender_id}]
      #{body}
    MESSAGE
  end
end
