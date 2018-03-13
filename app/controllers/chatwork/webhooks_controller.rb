class Chatwork::WebhooksController < ApplicationController

  def create
    message = ClassificationService.new(dialog_response[:result], current_user).perform

    Chatwork::Speaker
      .new(cw_message[:room_id], cw_message[:sender_id], message).speak
  end

  private
  def cw_message
    @cw_message ||= Chatwork::SanitizeHelper.new(params["webhook_event"]).excute
  end

  def dialog_response
    @dialog_response ||= Dialogflow::PostMan.new(cw_message[:body]).perform
  end

  def current_user
    info = {provider: "chatwork", uid: cw_message[:sender_id]}
    @current_user ||= if User.exists?(info)
                        User.find_by info
                      else
                        client = ChatWork::Client.new(api_key: ENV["CHATWORK_API_KEY"])
                        name = client.get_contacts.select {|x| x["account_id"] == cw_message[:sender_id]}.first["name"]
                        User.create info.merge(name: name)
                      end
  end
end
