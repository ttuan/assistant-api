class Chatwork::Speaker
  attr_reader :client, :body, :current_user

  def initialize current_user, body
    @client = ChatWork::Client.new api_key: ENV["CHATWORK_API_KEY"]
    @body = body
    @current_user = current_user
  end

  def speak
    client.create_message room_id: current_user.room_id, body: full_message
  end

  private
  def full_message
    <<~MESSAGE
      [To:#{current_user.uid}] #{current_user.name}
      #{body}
    MESSAGE
  end
end
