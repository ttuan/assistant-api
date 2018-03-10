class Chatwork::SanitizeHelper
  attr_reader :body, :sender_id, :room_id, :message_id

  def initialize info = {}
    @body = info["body"]
    @sender_id = info["from_account_id"]
    @room_id = info["room_id"]
    @message_id = info["message_id"]
  end

  def excute
    # TODO Using regex to ignore chatwork "TO" or "Quote"
    content = body.sub(/^\A(.*)$/, '')
    {
      body: content,
      sender_id: sender_id,
      room_id: room_id,
      message_id: message_id
    }
  end
end
