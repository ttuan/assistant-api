class Chatwork::SanitizeHelper
  attr_reader :body, :sender_id, :room_id

  def initialize info = {}
    @body = info["webhook_event"]["body"]
    @sender_id = info["webhook_event"]["from_account_id"]
    @room_id = info["webhook_event"]["room_id"]
  end

  def excute
    {
      body: body,
      sender_id: sender_id,
      room_id: room_id
    }
  end
end
